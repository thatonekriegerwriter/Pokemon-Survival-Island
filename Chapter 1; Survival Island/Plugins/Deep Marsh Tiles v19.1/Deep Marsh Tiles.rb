#===============================================================================
# Deep Marsh Tiles - By Vendily [v17]
# Updated for v19.1 by Mashirosakura & Kotaro
#==============================================================================
#Config	
#Amount of turns needed to break free from being stuck in the ground.
MARSHTILES_TURN_TIMES = 5
#Name of the SoundFile that should be played when the Player gets "unstuck". 
MARSHTILES_JUMP_SOUND = "Player jump"
#Set to true if you want double battles inside of marsh tiles
DOUBLE_BATTLE = false
#Set the Number bellow to a number that hasn't been used as a Terrain ID
DEEPMARSH_ID = 20
DEEPERMARSH_ID = 21
#Set to true if you want a chance to get stuck in the ground instead of always getting stuck
ALWAYS_STUCK = true
#add more numbers into this array to lower the chances of getting stuck with 3 numbers the chance is 1/3.
CHANCEARRAY = [1, 2, 3]
#==============================================================================
PluginManager.register({                                                 
  :name    => "Deep Marsh Tiles",                                        
  :version => "1.0",                                                     
  :link    => "https://reliccastle.com/resources/927/",            
  :credits => ["Kotaro", "Vendily", "Mashirosakura"],                                       
  :dependencies => [
	["v19.1 Hotfixes", "1.0.7"] 
  ]
	
}) 
#==============================================================================
module GameData
  class TerrainTag
    attr_accessor :stuck
    attr_accessor :mudfree
    attr_reader   :deep_marsh
	attr_reader   :deeper_marsh
    alias __stuckfreemud initialize
    def initialize(hash)
      __stuckfreemud(hash)
        @stuck       = hash[:stuck]       		|| false
        @mudfree     = hash[:mudfree]      		|| false
        @deep_marsh  = hash[:deep_marsh]   		|| false
		@deeper_marsh  = hash[:deeper_marsh]    || false
    end
  end
end  

GameData::Environment.register({
  :id          => :Mud,
  :name        => _INTL("Mud"),
  :battle_base => "mud"
})

GameData::TerrainTag.register({
  :id                     => :MarshDeep,
  :id_number              => DEEPMARSH_ID,
  :deep_marsh             => true,
  :must_walk              => true
}) 

GameData::TerrainTag.register({
  :id                     => :MarshDeeper,
  :id_number              => DEEPERMARSH_ID,
  :deeper_marsh           => true,
  :must_walk              => true
}) 
#==============================================================================

class PokemonGlobalMetadata
  attr_accessor :stuck
  attr_accessor :mudfree
  
  def stuck
    @stuck=false if !@stuck
    return @stuck
  end
end

class Game_Character
  def calculate_bush_depth
    if @tile_id > 0 || @always_on_top || jumping?
      @bush_depth = 0
    else
      deep_bush = regular_bush = false
      xbehind = @x + (@direction == 4 ? 1 : @direction == 6 ? -1 : 0)
      ybehind = @y + (@direction == 8 ? 1 : @direction == 2 ? -1 : 0)
      this_map = (self.map.valid?(@x, @y)) ? [self.map, @x, @y] : $MapFactory.getNewMap(@x, @y)
      if this_map[0].deepBush?(this_map[1], this_map[2]) && self.map.deepBush?(xbehind, ybehind)
        @bush_depth = Game_Map::TILE_HEIGHT
      elsif (!moving? && this_map[0].bush?(this_map[1], this_map[2])) || (self==$game_player && $PokemonGlobal.stuck)
        @bush_depth = 12
      else
        @bush_depth = 0
      end
    end
  end
end
#==============================================================================
Events.onStepTakenFieldMovement+=proc {|sender,e|
  event = e[0] # Get the event affected by field movement
  if $scene.is_a?(Scene_Map)
	chance = CHANCEARRAY.sample  
    currentTag = $game_player.pbTerrainTag
    if event==$game_player && currentTag.deeper_marsh && !$PokemonGlobal.mudfree
      pbStuckTile(event)
    elsif event==$game_player && currentTag.deep_marsh && !$PokemonGlobal.mudfree && chance==3
      pbStuckTile(event)
    end
  end
}
#==============================================================================
def pbStuckTile(event=nil)
  event = $game_player if !event
  return if !event
  $PokemonGlobal.stuck
  event.straighten
  event.calculate_bush_depth
  olddir=event.direction
  dir=olddir
  turntimes=0
  loop do
    break if turntimes>=MARSHTILES_TURN_TIMES
    Graphics.update
    Input.update
    pbUpdateSceneMap
    key=Input.dir4
    dir=key if key>0
    if dir!=olddir
      case dir
        when 2 then $game_player.turn_down
        when 4 then $game_player.turn_left
        when 6 then $game_player.turn_right
        when 8 then $game_player.turn_up
      end
      olddir=dir
      turntimes+=1
    end
  end
  event.center(event.x,event.y)
  event.straighten
  $PokemonGlobal.stuck=false
  $PokemonGlobal.mudfree=true
  event.jump(0,0)
  pbSEPlay(MARSHTILES_JUMP_SOUND)
  20.times do
    Graphics.update
    Input.update
    pbUpdateSceneMap
  end
  $PokemonGlobal.mudfree=false
end
#==============================================================================