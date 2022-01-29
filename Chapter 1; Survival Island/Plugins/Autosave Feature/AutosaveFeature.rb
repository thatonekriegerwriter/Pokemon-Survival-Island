#===============================================================================
# "Autosave Feature PE v19"
# By Caruban
#-------------------------------------------------------------------------------
# With this plugin, the game will be saved after player catching a Pokemon
# or when transferred into another map.
# Except : 
#  - Transferring between 2 indoor maps
#  - Transferring between 2 connected maps
#  - Transferring while doing the safari game
#  - Transferring while doing a bug catching contest
#  - Transferring while doing a battle challenge
#
# This plugin can be turned off/on temporary by using this script
# pbSetDisableAutosave = value (true or false)
# 
# or from the game options permanently.
#=============================================================================== 
# System and Temp Variables
#===============================================================================
class PokemonTemp
  attr_accessor :changeUnConnectedMap
  attr_accessor :disableAutosave
  attr_accessor :autosave_onload
  def changeUnConnectedMap
    @changeUnConnectedMap = false if !@changeUnConnectedMap
    return @changeUnConnectedMap
  end
  def disableAutosave
    @disableAutosave = false if !@disableAutosave
    return @disableAutosave
  end
  def autosave_onload
    @autosave_onload = false if !@autosave_onload
    return @autosave_onload
  end
end

class PokemonSystem
  attr_accessor :autosave
  def autosave
    # Autosave (0=on, 1=off)
    @autosave = 0 if !@autosave
    return @autosave
  end
end
#===============================================================================
# Game Option
#===============================================================================
class PokemonOption_Scene
  alias autosave_pbAddOnOptions pbAddOnOptions
  def pbAddOnOptions(options)
    options = autosave_pbAddOnOptions(options)
    options.push(
    EnumOption.new(_INTL("Autosave"),[_INTL("On"),_INTL("Off")],
         proc { $PokemonSystem.autosave },
         proc { |value| $PokemonSystem.autosave = value }
       )
    )
    return options
  end
end
#===============================================================================
# Script
#===============================================================================
def pbCanAutosave?
  return $PokemonSystem.autosave==0 && !$PokemonTemp.disableAutosave
end

def pbSetDisableAutosave=(value)
  $PokemonTemp.disableAutosave = value
end

def pbAutosave(scene = nil)
  scene = $scene if !scene
  if !pbInSafari? && !pbInBugContest? && !pbBattleChallenge.pbInChallenge?
    scene.spriteset.addUserSprite(Autosave.new)
    $PokemonTemp.begunNewGame = false
    Game.save
  end
end

# check if the map are connected
Events.onMapChange += proc { |_sender, e|
  old_map_ID = e[0]
  map_metadata = GameData::MapMetadata.try_get($game_map.map_id)
  old_map_metadata = GameData::MapMetadata.try_get(old_map_ID)
  if old_map_ID>0 && !$MapFactory.areConnected?($game_map.map_id, old_map_ID) && 
     map_metadata && old_map_metadata && (map_metadata.outdoor_map || old_map_metadata.outdoor_map)
    $PokemonTemp.changeUnConnectedMap = true 
  end
}

# walk out or in a building
Events.onMapSceneChange += proc { |_sender, e|
  scene      = e[0]
  mapChanged = e[1]
  if pbCanAutosave? && mapChanged && $PokemonTemp.changeUnConnectedMap
    pbAutosave(scene)
  end
  $PokemonTemp.changeUnConnectedMap = false  
  if !$PokemonTemp.autosave_onload
    # if saved while walk out building
    if $game_screen.tone == Tone.new(-255,-255,-255, 0)
      $game_screen.start_tone_change(Tone.new(0,0,0,0),6*Graphics.frame_rate / 20)
    end
    $PokemonTemp.autosave_onload = true
  end
}

# caught a pokemon
Events.onWildBattleEnd += proc { |_sender,e|
  decision = e[2]
  pbAutosave if pbCanAutosave? && decision==4
}

class Autosave
  def initialize
    @bitmapsprite = BitmapSprite.new(Graphics.width,Graphics.height,nil)
    @bitmap = @bitmapsprite.bitmap
    pbSetSmallFont(@bitmap)
    text=[["Now Saving...",392,1,0,Color.new(248,248,248),Color.new(97,97,97)]]
    pbDrawTextPositions(@bitmap,text)
    @bitmapsprite.visible = true
    @frame = 0
    @looptime = 0
    @i = 1
    @currentmap = $game_map.map_id
  end
  def pbStart
    @bitmapsprite.visible = true
    @i = -1
  end
  def isStart?
    return @start
  end
  def disposed?
    @bitmapsprite.disposed?
  end
  def update
    if @currentmap != $game_map.map_id
      @bitmapsprite.dispose
      return
    end
    if @frame > Graphics.frame_rate / 2
      if @looptime == 3
        @bitmapsprite.dispose
        @frame = 0
      else
        @looptime += 1
        @frame = 0
        @i *= -1
      end
    else
      @frame += 1
      @bitmapsprite.opacity += 10 * @i
    end
  end
  def dispose
    @bitmapsprite.dispose if @bitmapsprite
  end
end