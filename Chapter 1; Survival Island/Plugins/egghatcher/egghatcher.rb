######Egg Hatcher By: KYU  ##################################################
#There are two ways of using this script:
#   -Making an object:
#     First, add the following line to items PBS 
#     (change xxx to the id of the item):
#        XXX,EGGHATCHER,Egg Hatcher,Egg Hatchers,8,0,"An Egg Hatcher in which to keep up to 6 eggs until they hatch.",2,0,6
#     If you´re using v19, add EGGHATCHER.png to the Graphics/Items folder.
#     Else, add itemXXX.png to the Graphics/Icons folder.
#     
#     The functionality code is already implemented within this script. 
#     That includes item usage and egg storage after receiving them.
#
#   -External script call:
#     Whether calling it from the menu or a random npc, just call the following 
#     method:
#         openHatcher
#     In case of using this method to use the hatcher, you can use a 
#     global switch to make it available to the player. 
#     Just change openHatcher_SWITCH to the id of the switch you wanna use.
# 
#CREDITS MUST BE GIVEN TO EVERYONE LISTED ON THE POST
################################################################################
# CONSTANTS
################################################################################
EGGHATCHER_SWITCH = 50 # Global switch that indicates if the hatcher is available
################################################################################

if defined?(PluginManager)
  PluginManager.register({
  :name => "Egg Hatcher",
  :version => "1.1",
  :credits => ["Kyu","Clara","Turner"]
  })
end

class PokemonGlobalMetadata
  attr_accessor :eggs
  alias old_initialize initialize
  def initialize
    old_initialize
    @eggs ||= [nil,nil,nil,nil,nil,nil]
  end
end

#Box sprite of the hatcher
class EggSprite < SpriteWrapper
  def initialize(viewport,selected,pokemon, x, y)
    super(viewport)
    @sprites = {}
    @animframe = 0
    @curFrame = 0
    @pokemon = pokemon
    @selected = selected
    self.bitmap = Bitmap.new(68, 100)
    self.x = x
    self.y = y
    refresh
  end
  
  def refresh
    if @pokemon != nil
      @frameskip = 20
      if Settings::EGG_LEVEL
        #V19
        steps = @pokemon.steps_to_hatch
        sprite = GameData::Species.egg_icon_filename(@pokemon.species, @pokemon.form)
      else
        #V16-17-18
        steps = @pokemon.eggsteps
        sprite = "Graphics/Icons/iconEgg"
      end
      @frameskip = 15 if steps<10200
      @frameskip = 10 if steps<2550
      @frameskip = 5 if steps<1275
      @sprites["egg"] = AnimatedSprite.create(sprite,2,@frameskip,self.viewport)
      @sprites["egg"].x = self.x + 2
      @sprites["egg"].y = self.y - 5
      @sprites["egg"].play
      base = Color.new(6,35,52)
      shadow= Color.new(169,179,184)
      pbSetSystemFont(self.bitmap)
      pbDrawTextPositions(self.bitmap,[[steps.to_s,35,
      Settings::EGG_LEVEL ? 60 : 65,2,base,shadow]])
    end

    if @selected
      self.bitmap.blt(0,0,Bitmap.new("Graphics/Pictures/Egg Hatcher/selection"),Rect.new(0,0,68,100))
    end
  end

  def dispose
    super
    pbDisposeSpriteHash(@sprites)
  end
  
  def update
    pbUpdateSpriteHash(@sprites)
  end
end

#GlobalScene
class Hatcher
  def initialize
    if !$PokemonGlobal.eggs
      $PokemonGlobal.eggs ||= [nil,nil,nil,nil,nil,nil]
    end
    @viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @eggs = {}
    @index = 0
    
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = Bitmap.new("Graphics/Pictures/Egg Hatcher/hatcherbg")

    @sprites["text"] = Sprite.new(@viewport)
    @sprites["text"].bitmap = Bitmap.new(183,183)
    @sprites["text"].x = 290 
    @sprites["text"].y = 80
    pbSetSystemFont(@sprites["text"].bitmap)
    refresh
  end
  
  def refresh
    disposeEggs
    @sprites["text"].bitmap.clear
    eggs = $PokemonGlobal.eggs
    for index in 0..5
      if index < 3
        x = 46 + 80*index
        y = 46
      else
        x = 46 + 80*(index - 3)
        y = 158
      end
      selected = (index == @index)? true : false
      @eggs["#{index}"] = EggSprite.new(@viewport,selected,eggs[index], x, y)
    end
    
    if eggs[@index] != nil
      pokemon = eggs[@index]
      if Settings::EGG_LEVEL
        #V19
        steps = pokemon.steps_to_hatch
      else
        #V16-17-18
        steps = pokemon.eggsteps
      end
      eggstate=_INTL("It looks like this Egg will take a long time to hatch.")
      eggstate=_INTL("What will hatch from this Egg? It doesn´t seem close to hatching.") if steps<10200
      eggstate=_INTL("It appears to move occasionally. It may be close to hatching.") if steps<2550
      eggstate=_INTL("Sounds can be heard coming from inside! This Egg will hatch soon!") if steps<1275
      drawFormattedTextEx(@sprites["text"].bitmap,0,0,183,eggstate)
    end
  end
  
  def disposeEggs
    @eggs.each_value{|egg|
      egg.dispose
    }
  end
  
  def dispose
    disposeEggs
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
  
  def update
    loop do
      @eggs.each_value{|egg|
      egg.update
      }
      #Egg selector
      if Input.trigger?(Input::RIGHT) && (@index+1)%3 != 0
        @index += 1
        pbSEPlay("Choose")
        refresh
      end
      if Input.trigger?(Input::LEFT) && (@index != 0 && @index != 3)
        @index -= 1
        pbSEPlay("Choose")
        refresh
      end
      if Input.trigger?(Input::UP) && @index >= 3
        @index -= 3
        pbSEPlay("Choose")
        refresh
      end
      if Input.trigger?(Input::DOWN) && @index <= 2 
        @index += 3
        pbSEPlay("Choose")
        refresh
      end
      #Manipulate an egg
      if Input.trigger?(Input::C)
        if $PokemonGlobal.eggs[@index] == nil
          ret = Kernel.pbConfirmMessage("This hatcher is empty\\nDo you want to add an Egg?")
          if ret == true
            chosen=0
            pbFadeOutIn(99999){
              #Compatibility with Essentials v18.1
              if defined?(PokemonScreen_Scene) == 'constant' && PokemonScreen_Scene.class == Class
                scene=PokemonScreen_Scene.new
                screen=PokemonScreen.new(scene,$Trainer.party)
                screen.pbStartScene(_INTL("Choose an Egg."),false)
                chosen=screen.pbChoosePokemon
                screen.pbEndScene
              else #Essentials v16.2 and v17
                scene = PokemonParty_Scene.new
                screen = PokemonPartyScreen.new(scene,$Trainer.party)
                screen.pbStartScene(_INTL("Choose an Egg."),false)
                chosen=screen.pbChoosePokemon
                screen.pbEndScene
              end
            }
            if $Trainer.party[chosen] != nil
              if !$Trainer.party[chosen].egg?
                Kernel.pbMessage("The chosen Pokémon is not an Egg.")
              else
                $PokemonGlobal.eggs[@index] = $Trainer.party[chosen]
                $Trainer.party.delete_at(chosen)
              end
            end
          end
        else
          ret = Kernel.pbConfirmMessage("Do you want to take out this Egg?")
          if ret == true
            takeEgg($PokemonGlobal.eggs[@index],@index)
          end
        end
        refresh
      end
      #Close scene
      if Input.trigger?(Input::B)
        dispose
        Input.update
        break
      end
    
      Graphics.update
      Input.update
    end
  end
end

def takeEgg(egg,index)
  sel = Kernel.pbConfirmMessage(_INTL("Do you want to add it to your team?"))
  if sel==true
    Kernel.pbMessage(_INTL("Your party is full\1")) if $Trainer.party.length == 6
    pbStorePokemon(egg)
  else
    if pbBoxesFull?
      Kernel.pbMessage(_INTL("There´s no more room for Pokémon!\1"))
      Kernel.pbMessage(_INTL("The Pokémon Boxes are full and can't accept any more!"))
      return
    end
    oldcurbox=$PokemonStorage.currentBox
    storedbox=$PokemonStorage.pbStoreCaught(egg)
    curboxname=$PokemonStorage[oldcurbox].name
    boxname=$PokemonStorage[storedbox].name
    creator=nil
    creator=Kernel.pbGetStorageCreator if $PokemonGlobal.seenStorageCreator
    if storedbox!=oldcurbox
      if creator
        Kernel.pbMessage(_INTL("Box \"{1}\" is full.\1",curboxname,creator))
      else
        Kernel.pbMessage(_INTL("Box \"{1}\" is full.\1",curboxname))
      end
      Kernel.pbMessage(_INTL("{1} was transfered to box \"{2}.\"",egg.name,boxname))
    else
      Kernel.pbMessage(_INTL("{1} was transfered to box \"{2}.\"",egg.name,boxname))
    end
  end
  $PokemonGlobal.eggs[index] = nil
end

if Settings::EGG_LEVEL
  #V19
  def pbGenerateEgg(pkmn, text = "")
    return false if !pkmn || $Trainer.party_full?
    pkmn = Pokemon.new(pkmn, Settings::EGG_LEVEL) if !pkmn.is_a?(Pokemon)
    # Set egg's details
    pkmn.name           = _INTL("Egg")
    pkmn.steps_to_hatch = pkmn.species_data.hatch_steps
    pkmn.obtain_text    = text
    pkmn.calc_stats
    # Add egg to party
    if (GameData::Item.exists?(:EGGHATCHER) && $PokemonBag.pbHasItem?(:EGGHATCHER)) || $game_switches[EGGHATCHER_SWITCH]
      ret = Kernel.pbConfirmMessage("Do you want to add the egg to the hatcher?")
      if ret == true
        ret = addEgg(pkmn)
        if ret == true
          return true
        end
      end
    end
    pbStorePokemon(pkmn)
    return true
  end
else
  #V16-17-18
  def pbGenerateEgg(pokemon,text="")
    return false if !pokemon || !$Trainer
    if pokemon.is_a?(String) || pokemon.is_a?(Symbol)
      pokemon=getID(PBSpecies,pokemon)
    end
    begin
      if pokemon.is_a?(Integer)
      pokemon=PokeBattle_Pokemon.new(pokemon,EGGINITIALLEVEL,$Trainer)
      end
      # Get egg steps
      dexdata=pbOpenDexData
      pbDexDataOffset(dexdata,pokemon.species,21)
      eggsteps=dexdata.fgetw
      dexdata.close
      # Set egg's details
      pokemon.name=_INTL("Egg")
      pokemon.eggsteps=eggsteps
      pokemon.obtainText=text
      pokemon.calcStats
    rescue
      pokemon = getID(PBSpecies,pokemon)
      if pokemon.is_a?(Integer)
        pokemon = pbNewPkmn(pokemon,EGG_LEVEL)
      end
      # Get egg steps
      eggSteps = pbGetSpeciesData(pokemon.species,pokemon.form,SpeciesStepsToHatch)
      # Set egg's details
      pokemon.name       = _INTL("Egg")
      pokemon.eggsteps   = eggSteps
      pokemon.obtainText = text
      pokemon.calcStats
    end
    # Add egg to party
    if (getID(PBItems,:EGGHATCHER)==-1 || $PokemonBag.pbHasItem?(:EGGHATCHER)) || $game_switches[EGGHATCHER_SWITCH]
      ret = Kernel.pbConfirmMessage("Do you want to add the egg to the hatcher?")
      if ret == true
        ret = addEgg(pokemon)
        if ret == true
          return true
        end
      end
    end
    pbStorePokemon(pokemon)
    return true
  end
end

def addEgg(egg)
  if !$PokemonGlobal.eggs
    $PokemonGlobal.eggs ||= [nil,nil,nil,nil,nil,nil]
  end
  $PokemonGlobal.eggs.each_index{|index|
    if $PokemonGlobal.eggs[index] == nil
      $PokemonGlobal.eggs[index] = egg
      return true
    end
  }
  Kernel.pbMessage("The hatcher is full.")
  return false
end

if Settings::EGG_LEVEL
  #V19
  Events.onStepTaken+=proc {|sender,e|
     next if !$Trainer || !$PokemonGlobal.eggs
     for i in 0...$PokemonGlobal.eggs.length
       egg = $PokemonGlobal.eggs[i]
       next if egg == nil
       if egg.steps_to_hatch>0
         egg.steps_to_hatch-=1
         for x in $Trainer.party
           if x.hasAbility?(:FLAMEBODY) ||
              x.hasAbility?(:MAGMAARMOR)
             egg.steps_to_hatch-=1
             break
           end
         end
         if egg.steps_to_hatch<=0
          egg.steps_to_hatch=0
          pbHatch(egg)
          takeEgg(egg,i)
         end
       end
     end
  }
else
  #V16-17-18
  Events.onStepTaken+=proc {|sender,e|
     next if !$Trainer || !$PokemonGlobal.eggs
     for i in 0...$PokemonGlobal.eggs.length
       egg = $PokemonGlobal.eggs[i]
       next if egg == nil
       if egg.eggsteps>0
         egg.eggsteps-=1
         for x in $Trainer.pokemonParty
           if isConst?(x.ability,PBAbilities,:FLAMEBODY) ||
              isConst?(x.ability,PBAbilities,:MAGMAARMOR)
             egg.eggsteps-=1
             break
           end
         end
         if egg.eggsteps<=0
          egg.eggsteps=0
          pbHatch(egg)
          takeEgg(egg,i)
         end
       end
     end
  }
end

ItemHandlers::UseFromBag.add(:EGGHATCHER,proc{|item|
  pbFadeOutIn(99999){
    openHatcher
  }
  next 1
})

def openHatcher
  scene = Hatcher.new
  scene.update
end

