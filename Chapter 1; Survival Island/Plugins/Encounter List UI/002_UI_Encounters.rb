#########################################################
###                 Encounter list UI                 ###
### Based on the original resource by raZ and friends ###
#########################################################


# This is the name of a graphic in your Graphics/Pictures folder that changes the look of the UI
# If the graphic does not exist, you will get an error
WINDOWSKIN = "base.png"

# This hash allows you to define the names of your encounter types if you want them to be more logical
# E.g. "Surfing" instead of "Water"
# If missing, the script will use the encounter type names in GameData::EncounterTypes
USER_DEFINED_NAMES = {
:Land => "Grass",
:LandDay => "Grass (day)",
:LandNight => "Grass (night)",
:LandMorning => "Grass (morning)",
:LandAfternoon => "Grass (afternoon)", 
:LandEvening => "Grass (evening)",
:Cave => "Cave",
:CaveDay => "Cave (day)",
:CaveNight => "Cave (night)",
:CaveMorning => "Cave (morning)",
:CaveAfternoon => "Cave (afternoon)",
:CaveEvening => "Cave (evening)",
:Water => "Surfing",
:WaterDay => "Surfing (day)",
:WaterNight => "Surfing (night)",
:WaterMorning => "Surfing (morning)",
:WaterAfternoon => "Surfing (afternoon)",
:WaterEvening => "Surfing (evening)",
:OldRod => "Fishing (Old Rod)",
:GoodRod => "Fishing (Good Rod)",
:SuperRod => "Fishing (Super Rod)",
:RockSmash => "Rock Smash",
:HeadbuttLow => "Headbutt (rare)",
:HeadbuttHigh => "Headbutt (common)",
:BugContest => "Bug Contest"
}

# Remove the '#' from this line to use default encounter type names
#USER_DEFINED_NAMES = nil

# Method that returns whether a specific form has been seen (any gender)
def seen_form_any_gender?(species, form)
  ret = false
  if $Trainer.pokedex.seen_form?(species, 0, form) ||
    $Trainer.pokedex.seen_form?(species, 1, form)
    ret = true
  end
  return ret
end

class EncounterList_Scene

  # Constructor method
  # Sets a handful of key variables needed throughout the script
  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    mapid = $game_variables[4977]
    @encounter_data = GameData::Encounter.get(mapid, $PokemonGlobal.encounter_version)
    if @encounter_data   #if it finds encounter data for the map
      @encounter_tables = Marshal.load(Marshal.dump(@encounter_data.types))
      @max_enc, @eLength = getMaxEncounters(@encounter_tables)
    else
      @max_enc, @eLength = [1, 1]
    end
    @index = 0
  end
 
  # This gets the highest number of unique encounters across all defined encounter types for the map
  # It might sound weird, but this is needed for drawing the icons
  def getMaxEncounters(data)
    keys = data.keys
    a = []
    for key in keys
      b = []
      arr = data[key]
      for i in 0...arr.length
        b.push( arr[i][1] )
      end
      a.push(b.uniq.length)
    end
    return a.max, keys.length
  end
  
  # This method initiates the following:
  # Background graphics, text overlay, Pokémon sprites and navigation arrows
  def pbStartScene
    @selectX=0
    @selectY=0
    @selection=0
    if !File.file?("Graphics/Pictures/EncounterUI/"+WINDOWSKIN)
      raise _INTL("You are missing the graphic for this UI. Make sure the image is in your Graphics/Pictures folder and that it is named appropriately.")
    end
    addBackgroundPlane(@sprites,"bg","EncounterUI/bg",@viewport)
    @sprites["base"] = IconSprite.new(0,0,@viewport)
    @sprites["base"].setBitmap("Graphics/Pictures/EncounterUI/"+WINDOWSKIN)
    @sprites["base"].ox = @sprites["base"].bitmap.width/2
    @sprites["base"].oy = @sprites["base"].bitmap.height/2
    @sprites["base"].x = Graphics.width/2; @sprites["base"].y = Graphics.height/2
    @sprites["base"].opacity = 200
    @sprites["locwindow"] = Window_AdvancedTextPokemon.new("")
    @sprites["locwindow"].viewport = @viewport
    @sprites["locwindow"].width = 512
    @sprites["locwindow"].height = 344
    @sprites["locwindow"].x = (Graphics.width - @sprites["locwindow"].width)/2
    @sprites["locwindow"].y = (Graphics.height - @sprites["locwindow"].height)/2
    @sprites["locwindow"].windowskin = nil
    @h = (Graphics.height - @sprites["base"].bitmap.height)/2
    @w = (Graphics.width - @sprites["base"].bitmap.width)/2
    @max_enc.times do |i|
      @sprites["icon_#{i}"] = PokemonSpeciesIconSprite.new(nil,@viewport)
      @sprites["icon_#{i}"].x = @w + 28 + 64*(i%7)
      @sprites["icon_#{i}"].y = @h + 100 + (i/7)*64
      @sprites["icon_#{i}"].visible = false
    end
    @sprites["rightarrow"] = AnimatedSprite.new("Graphics/Pictures/rightarrow",8,40,28,2,@viewport)
    @sprites["rightarrow"].x = Graphics.width - @sprites["rightarrow"].bitmap.width
    @sprites["rightarrow"].y = Graphics.height/2 - @sprites["rightarrow"].bitmap.height/16
    @sprites["rightarrow"].visible = false
    @sprites["rightarrow"].play
    @sprites["leftarrow"] = AnimatedSprite.new("Graphics/Pictures/leftarrow",8,40,28,2,@viewport)
    @sprites["leftarrow"].x = 0
    @sprites["leftarrow"].y = Graphics.height/2 - @sprites["rightarrow"].bitmap.height/16
    @sprites["leftarrow"].visible = false
    @sprites["leftarrow"].play
    @sprites["selector"]=IconSprite.new(@selectX,@selectY,@viewport)
    @sprites["selector"].setBitmap("Graphics/Pictures/craftingMenu/craftSelect")
    @sprites["selector"].visible = false
    @sprites["selector"].x += @w + 28 + 8
    @sprites["selector"].y = @h + 100 + 13
    @encounter_data ? drawPresent : drawAbsent
    pbFadeInAndShow(@sprites) { pbUpdate }
  end
  
  # Main function that controls the UI
  def pbEncounter
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::RIGHT) && @eLength >1 && @index< @eLength-1
        pbPlayCursorSE
        hideSprites
        @index += 1
        drawPresent
      elsif Input.trigger?(Input::LEFT) && @eLength >1 && @index !=0
        pbPlayCursorSE
        hideSprites
        @index -= 1
        drawPresent
	  elsif Input.trigger?(Input::USE)
          @sprites["selector"].visible = true
	      pbEncounterInteract
      elsif Input.trigger?(Input::BACK)
        pbPlayCloseMenuSE
        break
      end
    end
  end
 

  def pbEncounterInteract
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::RIGHT) 
	    if @selection==11
		@sprites["selector"].x = 40
        @sprites["selector"].y = 130
        @selection=0
		elsif @selection==6
        @sprites["selector"].y = 200
        @sprites["selector"].x -= (64*@selection)
          @selection+=1
		else
          @sprites["selector"].x+=64
          @selection+=1
		end
      elsif Input.trigger?(Input::LEFT) 
	    if @selection==0
		@sprites["selector"].x += (64*4)
        @sprites["selector"].y = 200
        @selection=11
		elsif @selection==7
        @selection-=1
        @sprites["selector"].x = 40+(64*@selection)
        @sprites["selector"].y = 130
		else
          @sprites["selector"].x-=64
          @selection-=1
		end
      elsif Input.trigger?(Input::DOWN)
		@selection+=7
		if @selection>11 
		 @selection=11
		else
        @sprites["selector"].y += 70
		end 
      elsif Input.trigger?(Input::UP) 
		@selection-=7
		if @selection<0 
		 @selection=0
		else
        @sprites["selector"].y -= 70
		end
	  elsif Input.trigger?(Input::USE)
	  pbArceusTasks
      elsif Input.trigger?(Input::BACK)
	    @sprites["selector"].visible = false
        @sprites["selector"].x -= (64*@selection)
        @selection=0
        pbEncounter
        break
      end
    end
  end
 
 
 
  def pbArceusTasks
      if @selection==0
           i = 0
          enc_array, currKey = getEncData
         enc_array.each do |s|
          species_data = GameData::Species.get(s)
         if !$Trainer.pokedex.owned?(s) && !seen_form_any_gender?(s,species_data.form)
 		     pbMessage(_INTL("{1}",(s)))
         elsif !$Trainer.pokedex.owned?(s)
 		     pbMessage(_INTL("{1}",(s)))
         else
 		     pbMessage(_INTL("{1}",(s)))
         end
	   i += 1
    end
   end
   end
  # Draw text and icons if map has encounters defined
  def drawPresent
    @sprites["rightarrow"].visible = (@index < @eLength-1) ? true : false
    @sprites["leftarrow"].visible = (@index > 0) ? true : false
    i = 0
    enc_array, currKey = getEncData
    enc_array.each do |s|
      species_data = GameData::Species.get(s)
      if !$Trainer.pokedex.owned?(s) && !seen_form_any_gender?(s,species_data.form)
        @sprites["icon_#{i}"].pbSetParams(0,0,0,false)
        @sprites["icon_#{i}"].visible = true
      elsif !$Trainer.pokedex.owned?(s)
        @sprites["icon_#{i}"].pbSetParams(s,0,species_data.form,false)
        @sprites["icon_#{i}"].tone = Tone.new(0,0,0,255)
        @sprites["icon_#{i}"].visible = true
      else
        @sprites["icon_#{i}"].pbSetParams(s,0,species_data.form,false)
        @sprites["icon_#{i}"].tone = Tone.new(0,0,0,0)
        @sprites["icon_#{i}"].visible = true
      end
      i += 1
    end
    # Get user-defined encounter name or default one if not present
    name = USER_DEFINED_NAMES ? USER_DEFINED_NAMES[currKey] : GameData::EncounterType.get(currKey).real_name
	idealmap = pbGetMapNameFromId($game_variables[4977])
    loctext = _INTL("<ac><c2=43F022E8>{1}: {2}</c2></ac>", idealmap,name)
    loctext += sprintf("<al><c2=7FF05EE8>Total encounters for area: %s</c2></al>",enc_array.length)
    loctext += sprintf("<c2=63184210>-----------------------------------------</c2>")
    @sprites["locwindow"].setText(loctext)
  end
  
  # Draw text if map has no encounters defined (e.g. in buildings)
  def drawAbsent
    loctext = _INTL("<ac><c2=43F022E8>{1}</c2></ac>", $game_map.name)
    loctext += sprintf("<al><c2=7FF05EE8>This area has no encounters!</c2></al>")
    loctext += sprintf("<c2=63184210>-----------------------------------------</c2>")
    @sprites["locwindow"].setText(loctext)
  end
 
  # Method that returns an array of symbolic names for chosen encounter type on current map
  # Currently, the resulting array is sorted by national Pokédex number
  def getEncData
    currKey = @encounter_tables.keys[@index]
    arr = []
    enc_array = []
    @encounter_tables[currKey].each { |s| arr.push( s[1] ) }
    GameData::Species.each { |s| enc_array.push(s.id) if arr.include?(s.id) } # From Maruno
    enc_array.uniq!
    return enc_array, currKey
  end
  
  def pbUpdate
    pbUpdateSpriteHash(@sprites)
  end
  
  # Hide sprites
  def hideSprites
    for i in 0...@max_enc
      @sprites["icon_#{i}"].visible = false
    end
  end

  # Dipose stuff at the end
  def pbEndScene
    pbFadeOutAndHide(@sprites) { pbUpdate }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

end


class EncounterList_Screen
  def initialize(scene)
    @scene = scene
  end

  def pbStartScreen
    @scene.pbStartScene
    @scene.pbEncounter
    @scene.pbEndScene
  end
end
