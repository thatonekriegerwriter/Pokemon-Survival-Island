#==============================================================================#
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
#==============================================================================#
#                                                                              #
#                             Survival Mode                                    #
#                          By thatonekriegerwriter                             #
#                 Original Hunger Script by Maurili and Vendily                #
#                                                                              #
#                                                                              #
#                                                                              #
#==============================================================================#
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
#==============================================================================#
#Thanks Maurili and Vendily for the Original Hunger Script                     #

Events.onStepTakenTransferPossible+=proc {


pbchangeFood
pbchangeWater
pbchangeHealth
pbchangeSaturation
pbchangeSleep
pbDiscord




if $game_switches[54]==false 
 if $PokemonSystem.survivalmode == 0
   Achievements.incrementProgress("SURVIVOR",1)
   $game_switches[54]=true 
 end
end

$game_switches[70]=true
#pbchangeStamina


 if $Trainer.pokemonCount==6
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
  if rand(255)==3
  $Trainer.party[1].changeFood
  pbPokeAging($Trainer.party[1])
  end
  if rand(255)==5
  $Trainer.party[2].changeFood
  pbPokeAging($Trainer.party[2])
  end
  if rand(255)==7
  $Trainer.party[3].changeFood
  pbPokeAging($Trainer.party[3])
  end
  if rand(255)==8
  $Trainer.party[4].changeFood
  pbPokeAging($Trainer.party[4])
  end
  if rand(255)==17
  $Trainer.party[5].changeFood
  pbPokeAging($Trainer.party[5])
  end
 elsif $Trainer.pokemonCount==5
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
  if rand(255)==3
  $Trainer.party[1].changeFood
  pbPokeAging($Trainer.party[1])
  end
  if rand(255)==5
  $Trainer.party[2].changeFood
  pbPokeAging($Trainer.party[2])
  end
  if rand(255)==7
  $Trainer.party[3].changeFood
  pbPokeAging($Trainer.party[3])
  end
  if rand(255)==8
  $Trainer.party[4].changeFood
  pbPokeAging($Trainer.party[4])
  end
 elsif $Trainer.pokemonCount==4
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
  if rand(255)==3
  $Trainer.party[1].changeFood
  pbPokeAging($Trainer.party[1])
  end
  if rand(255)==5
  $Trainer.party[2].changeFood
  pbPokeAging($Trainer.party[2])
  end
  if rand(255)==7
  $Trainer.party[3].changeFood
  pbPokeAging($Trainer.party[3])
  end
 elsif $Trainer.pokemonCount==3
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
  if rand(255)==3
  $Trainer.party[1].changeFood
  pbPokeAging($Trainer.party[1])
  end
  if rand(255)==5
  $Trainer.party[2].changeFood
  pbPokeAging($Trainer.party[2])
  end
 elsif $Trainer.pokemonCount==2
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
  if rand(255)==3
  $Trainer.party[1].changeFood
  pbPokeAging($Trainer.party[1])
  end
 elsif $Trainer.pokemonCount==1
  if rand(255)==1
  $Trainer.party[0].changeFood
  pbPokeAging($Trainer.party[0])
  end
 end

if rand(255)==1
 $Trainer.pokemon_party.each do |pkmn|
  pkmn.changeWater
end
end

$Trainer.pokemon_party.each do |pkmn|
  if pkmn.sleep == 120
    pkmn.permadeath=true
    pbMessage(_INTL("{1} seems to have passed due to old age!"))
  end
end
 


if $game_switches[75]==true && $PokemonSystem.survivalmode = 1 && $PokemonSystem.nuzlockemode = 1 && ($game_variables[30]=0 || $game_variables[30]=1)
   $game_variables[30]=2
   $PokemonSystem.survivalmode = 0
   $PokemonSystem.nuzlockemode = 0
   
end

data = EliteBattle.get_data(:NUZLOCKE, :Metrics, :RULES); data = [] if data.nil?
if $PokemonSystem.survivalmode == 0 && $game_switches[75]==false && $game_variables[204]==2 && (EliteBattle.get(:nuzlocke) && (data.include?(:NOREVIVE) || data.include?(:PERMADEATH)))
pbLifeCheck
end

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end


}

Events.onMapChanging  += proc {

#------------------------------------------------------------------------------#
#--------------------------Temperature                 ------------------------#
#------------------------------------------------------------------------------#
  pbEachPokemon { |poke,_box|
	  poke.changeHappiness("neglected",poke)
	  poke.changeLoyalty("neglected",poke)
  }

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end
  
if $PokemonSystem.survivalmode == 0 && GameData::MapMetadata.get($game_map.map_id).outdoor_map

  if pbIsSpring == true && GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:Rain, 9, 20)  if rand(200) <= 25
   $game_variables[387] += 0 if rand(50) == 1 #ambienttemperature
  end

  if pbIsSummer == true && GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:Sun, 9, 20)  if rand(200) <= 50 && !($game_screen.weather_type==:Rain)
   $game_variables[387] += 3 if rand(50) == 1 #ambienttemperature
  end

  if pbIsAutumn  == true && GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:Rain, 9, 20)  if rand(200) <= 25
   $game_screen.weather(:HeavyRain, 9, 20) if rand(200) <= 15
   $game_variables[387] -= 2 if rand(40) == 5 #ambienttemperature
  end

  if pbIsWinter  == true && GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:Snow, 9, 20) if rand(200) <= 40 && !($game_screen.weather_type==:Blizzard)
   $game_screen.weather(:Blizzard, 9, 20) if rand(200) <= 15 && !($game_screen.weather_type==:Snow)
   $game_variables[387] -= 4 if rand(20) == 5 #ambienttemperature
   if ($game_screen.weather_type==:Rain)
      $game_screen.weather(:Snow, 9, 20) if rand(200) <= 40 && !($game_screen.weather_type==:Blizzard)
  	  $game_screen.weather(:Blizzard, 9, 20) if rand(200) <= 15 && !($game_screen.weather_type==:Snow)
  end

end
 case $game_variables[384] #Month
   when 0 #Jan
    $game_variables[387] -= 3 if rand(50) == 1 #ambienttemperature
   when 1 #Feb
    $game_variables[387] -= 5 if rand(50) == 1 #ambienttemperature
   when 2 #Mar
    $game_variables[387] += 1 if rand(50) == 1 #ambienttemperature
   when 3 #April
    $game_variables[387] += 2 if rand(50) == 1 #ambienttemperature
   when 4 #may
    $game_variables[387] += 2 if rand(50) == 1 #ambienttemperature
   when 5 #june
    $game_variables[387] += 3 if rand(50) == 1 #ambienttemperature
   when 6 #july
    $game_variables[387] += 2 if rand(40) == 5 #ambienttemperature
   when 7 #august
    $game_variables[387] += 6 if rand(20) == 5 #ambienttemperature
   when 8 #september
    $game_variables[387] += 0 if rand(50) == 1 #ambienttemperature
   when 9 #october
    $game_variables[387] += 3 if rand(50) == 1 #ambienttemperature
   when 10 #november
    $game_variables[387] -= 2 if rand(40) == 5 #ambienttemperature
   when 11 #december
    $game_variables[387] -= 3 if rand(20) == 5 #ambienttemperature
 end



 case $game_variables[382] #Day
   when 0

   when 1

   when 2

   when 3

   when 4

   when 5

   when 6

 end

#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
end

}






def pbPokemonAttacks
    Kernel.pbMessage(_INTL("The Pokemon attacks you!."))
	$Trainer.playerhealth-=rand(20)
end

def pbSleepRestore
 $Trainer.playerstamina = $Trainer.playermaxstamina
 if $Trainer.playersleep<200
  $Trainer.playersleep=$Trainer.playersleep+($game_variables[247]*6)
 end
 if $Trainer.playersaturation<1
   $Trainer.playerfood=$Trainer.playerfood-($game_variables[247]*3)
   $Trainer.playerwater=$Trainer.playerwater-($game_variables[247]*3)
   
  else
   $Trainer.playersaturation=$Trainer.playersaturation-($game_variables[247]*3)
 end
  deposited = pbDayCareDeposited
  if deposited==2 && $PokemonGlobal.daycareEgg==0
    $PokemonGlobal.daycareEggSteps = 0 if !$PokemonGlobal.daycareEggSteps
    $PokemonGlobal.daycareEggSteps += (1*$game_variables[247]*10)
  end
 end

 
 def pbEating(bag,item)
 
$PokemonBag.pbDeleteItem(item)
if item == :ORANBERRY
$Trainer.playerfood+=4
$Trainer.playersaturation+=3
$Trainer.playerwater+=1
$Trainer.playerhealth += 1
return 1
elsif item == :LEPPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :CHERIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :CHESTOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :PECHABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :RAWSTBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :ASPEARBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :PERSIMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :LUMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :FIGYBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :WIKIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :MAGOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :AGUAVBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
return 1
elsif item == :SITRUSBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=7
$Trainer.playerwater+=1
$Trainer.playerhealth += (0.25*$Trainer.playerhealth)
return 1
elsif item == :BERRYJUICE
$Trainer.playerfood+=6
$Trainer.playersaturation+=4
$Trainer.playerwater+=4
$Trainer.playerhealth += 2
return 1
elsif item == :FRESHWATER
$Trainer.playerwater+=20
$Trainer.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
#You can add more if you want
elsif item == :ATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :SATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :SPEEDCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :SPDEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :ACCCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=12
$Trainer.playerwater-=7
return 1
elsif item == :DEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :CRITCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
return 1
elsif item == :GSCURRY
$Trainer.playerfood+=8#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=7#206 is Thirst
return 1
elsif item == :RAGECANDYBAR #chocolate
$Trainer.playerfood+=10
$Trainer.playersaturation+=3
$Trainer.playersleep+=7
return 1
elsif item == :SWEETHEART #chocolate
$Trainer.playerfood+=10#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playersleep+=6#208 is Sleep
return 1
elsif item == :SODAPOP
$Trainer.playerwater-=11#206 is Thirst
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playersleep+=10#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :LEMONADE
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playerwater+=10#206 is Thirst
$Trainer.playersleep+=7#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :HONEY
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
return 1
elsif item == :MOOMOOMILK
$Trainer.playersaturation+=10
$Trainer.playerwater+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :CSLOWPOKETAIL
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerfood+=10#205 is Hunger
return 1
elsif item == :BAKEDPOTATO
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=4#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
return 1
elsif item == :APPLE
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
return 1
elsif item == :CHOCOLATE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=7#205 is Hunger
return 1
elsif item == :LEMON
$Trainer.playersaturation+=3#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=4#205 is Hunger
return 1
elsif item == :OLDGATEAU
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
return 1
elsif item == :LAVACOOKIE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=3#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
return 1
elsif item == :CASTELIACONE
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
return 1
elsif item == :LUMIOSEGALETTE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=6#205 is Hunger
return 1
elsif item == :SHALOURSABLE
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
return 1
elsif item == :BIGMALASADA
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
return 1
elsif item == :ONION
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
return 1
elsif item == :COOKEDORAN
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=6#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
return 1
elsif item == :CARROT
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
return 1
elsif item == :BREAD
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=11#205 is Hunger
return 1
elsif item == :TEA
$Trainer.playersaturation+=15#207 is Saturation
$Trainer.playerwater+=8#206 is Thirst
$Trainer.playerfood+=2#205 is Hunger
return 1
elsif item == :CARROTCAKE
$Trainer.playersaturation+=15#207 is Saturation
$Trainer.playerwater+=15#206 is Thirst
$Trainer.playerfood+=10#205 is Hunger
return 1
elsif item == :COOKEDMEAT
$Trainer.playersaturation+=40#207 is Saturation
$Trainer.playerwater+=0#206 is Thirst
$Trainer.playerfood+=20#205 is Hunger
return 1
elsif item == :SITRUSJUICE
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=25#206 is Thirst
$Trainer.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :BERRYMASH
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=5#206 is Thirst
$Trainer.playerfood+=5#205 is Hunger
return 1
elsif item == :LARGEMEAL
$Trainer.playersaturation+=50#207 is Saturation
$Trainer.playerwater+=50#206 is Thirst
$Trainer.playerfood+=50#205 is Hunger
$Trainer.playerstaminamod+=15#205 is Hunger
 if $Trainer.pokemonCount==6
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[1].ev[:DEFENSE] += 1
  $Trainer.party[2].ev[:DEFENSE] += 1
  $Trainer.party[3].ev[:DEFENSE] += 1
  $Trainer.party[4].ev[:DEFENSE] += 1
  $Trainer.party[5].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
  $Trainer.party[1].ev[:HP] += 1
  $Trainer.party[2].ev[:HP] += 1
  $Trainer.party[3].ev[:HP] += 1
  $Trainer.party[4].ev[:HP] += 1
  $Trainer.party[5].ev[:HP] += 1
 elsif $Trainer.pokemonCount==5
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[1].ev[:DEFENSE] += 1
  $Trainer.party[2].ev[:DEFENSE] += 1
  $Trainer.party[3].ev[:DEFENSE] += 1
  $Trainer.party[4].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
  $Trainer.party[1].ev[:HP] += 1
  $Trainer.party[2].ev[:HP] += 1
  $Trainer.party[3].ev[:HP] += 1
  $Trainer.party[4].ev[:HP] += 1
 elsif $Trainer.pokemonCount==4
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[1].ev[:DEFENSE] += 1
  $Trainer.party[2].ev[:DEFENSE] += 1
  $Trainer.party[3].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
  $Trainer.party[1].ev[:HP] += 1
  $Trainer.party[2].ev[:HP] += 1
  $Trainer.party[3].ev[:HP] += 1
 elsif $Trainer.pokemonCount==3
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[1].ev[:DEFENSE] += 1
  $Trainer.party[2].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
  $Trainer.party[1].ev[:HP] += 1
  $Trainer.party[2].ev[:HP] += 1
 elsif $Trainer.pokemonCount==2
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[1].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
  $Trainer.party[1].ev[:HP] += 1
 elsif $Trainer.pokemonCount==1
  $Trainer.party[0].ev[:DEFENSE] += 1
  $Trainer.party[0].ev[:HP] += 1
 end
return 1
else
$PokemonBag.pbStoreItem(item,1)
return 0
end
end



 def pbMedicine(bag,item)
 
$PokemonBag.pbDeleteItem(item)
#205 is Hunger, 207 is Saturation, 206 is Thirst, 208 is Sleep
if item == :POTION
$Trainer.playerhealth += 20
return 1
elsif item == :SUPERPOTION
$Trainer.playerhealth += 40
return 1
elsif item == :HYPERPOTION
$Trainer.playerhealth += 60
return 1
elsif item == :FULLRESTORE
$Trainer.playerhealth += 100
return 1
else
$PokemonBag.pbStoreItem(item,1)
return 0
#full belly
end
end

def pbEndGame
 if $PokemonSystem.survivalmode = 0
  if $scene.is_a?(Scene_Map)
      pbFadeOutIn(99999){
         $game_temp.player_transferring = true
         $game_temp.player_new_map_id=292  
         $game_temp.player_new_x=002
         $game_temp.player_new_y=007
         $game_temp.player_new_direction=$PokemonGlobal.pokecenterDirection
         $scene.transfer_player
         $game_map.refresh
		 $scene = nil
		 exit!
    	 menu.pbShowMenu
      }
    end
  end
end



def pbRandomEvent
   if rand(100) == 1
     Kernel.pbMessage(_INTL("There was a sound outside."))   #Comet
     $game_switches[450]==true 
     $game_switches[451]==true 
=begin
   elsif rand(1000) == 2
     
   elsif rand(1000) == 3
     
   elsif rand(1000) == 4
     
   elsif rand(1000) == 5
     
   elsif rand(1000) == 6
=end
end
end


ItemHandlers::UseFromBag.add(:WATERBOTTLE,proc { |item|
if $game_player.pbFacingTerrainTag.can_surf
     message=(_INTL("Want to pick up water?"))
    if pbConfirmMessage(message)
       $PokemonBag.pbStoreItem(:WATER,1)
	end
	next 4
   else
    Kernel.pbMessage(_INTL("That is not water."))
	next 0
end
})
ItemHandlers::UseFromBag.add(:IRONAXE,proc { |item|
if $game_player.pbFacingTerrainTag.can_knockdown
     message=(_INTL("Want to knock down some branches?"))
    if pbConfirmMessage(message)
       $PokemonBag.pbStoreItem(:ACORN,(rand(6)))
	end
	next 4
   else
    Kernel.pbMessage(_INTL("That is not a tree."))
	next 0
end
})

class Pokemon

  def changeFood
    gain = 0
    food_range = @food / 100
    gain = [-1, -2, -2][food_range]
#    if gain > 0
#      gain += 1 if @obtain_map == $game_map.map_id
#      gain += 1 if @poke_ball == :LUXURYBALL
#      gain = (gain * 1.5).floor if hasItem?(:SOOTHEBELL)
#    end
    @food = (@food + gain).clamp(0, 255)
  end
  
  def changeWater
    gain = 0
    water_range = @water / 100
    gain = [-1, -2, -2][water_range]
#    if gain > 0
#      gain += 1 if @obtain_map == $game_map.map_id
#      gain += 1 if @poke_ball == :LUXURYBALL
#      gain = (gain * 1.5).floor if hasItem?(:SOOTHEBELL)
#    end
    @water = (@water + gain).clamp(0, 255)
  end
  
  def changeAge
    gain = 0
    age_range = @age / 100
    gain = [-1, -2, -2][age_range]
#    if gain > 0
#      gain += 1 if @obtain_map == $game_map.map_id
#      gain += 1 if @poke_ball == :LUXURYBALL
#      gain = (gain * 1.5).floor if hasItem?(:SOOTHEBELL)
#    end
    @age = (@age + gain).clamp(0, 255)
  end
end


  def pbchangeFood
    if $Trainer.playerfood < 0
	   $Trainer.playerfood=0
	end
    if $game_variables[256]==(:SSHIRT)
      if $Trainer.playerfood>150
        $Trainer.playerfood=150  #food
	  end
    elsif $Trainer.playerfood>100
        $Trainer.playerfood=100
  end
    $Trainer.playerfood -= 1 if rand(100) == 1 && $Trainer.playersaturation==0 && $game_variables[256]== 0
    $Trainer.playerfood += 1 if rand(100) == 1 && $game_variables[256]==(:LCLOAK) && !$Trainer.playersaturation==0
    $Trainer.playerfood += 0 if rand(100) == 1 && $game_variables[256]==(:LCLOAK) && $Trainer.playersaturation==0
    $Trainer.playerwater += 2 if rand(100) == 1 && $game_variables[256]==(:LJACKET)
  end

  def pbchangeWater
    if $Trainer.playerwater < 0
	   $Trainer.playerwater=0
	end
    if $game_variables[256]==(:SSHIRT) 
       if $Trainer.playerwater>150
        $Trainer.playerwater=150  #thirst
	   end
    elsif $Trainer.playerwater>100
        $Trainer.playerwater=100  #sleep
	end
    $Trainer.playerwater -= 1 if rand(100) ==1 && $Trainer.playersaturation==0 && $game_variables[256]== 0
    $Trainer.playerwater += 1 if rand(100) == 1 && $game_variables[256]==(:LCLOAK) && !$Trainer.playersaturation==0
    $Trainer.playerwater += 0 if rand(100) == 1 && $game_variables[256]==(:LCLOAK) && $Trainer.playersaturation==0
    $Trainer.playerwater += 2 if rand(100) == 1 && $game_variables[256]==(:SEASHOES) && $PokemonGlobal.surfing
	
	
    end
      




  def pbchangeSleep
    if $Trainer.playersleep < 0
	   $Trainer.playersleep=0
	end
    if $game_variables[256]==(:SSHIRT)
        if $Trainer.playersleep>150
           $Trainer.playersleep=150 
		end
    elsif $Trainer.playersleep>200
        $Trainer.playersleep=200  #sleep
	end
      gain = 0
	  base = 0
	  bonus = 0
      base = -1 if PBDayNight.isDay?(pbGetTimeNow)
      base = 0 if PBDayNight.isMorning?(pbGetTimeNow)
      base = -1 if PBDayNight.isAfternoon?(pbGetTimeNow)
      base = -2 if PBDayNight.isEvening?(pbGetTimeNow)
      base = -3 if PBDayNight.isNight?(pbGetTimeNow)
      bonus = -4 if $Trainer.playerstamina < 0
    
    $Trainer.playersleep += (gain + base + bonus) if rand(100) == 1
  end

  def pbchangeSaturation
    if $Trainer.playersaturation < 1
	   $Trainer.playersaturation=0
	end
    if $game_variables[256]==(:SSHIRT)
         if $Trainer.playersaturation>50
            $Trainer.playersaturation=50 
		 end
	end
    $Trainer.playersaturation -= 1 if rand(100) == 1 && $game_variables[256]== 0
    $Trainer.playersaturation -= 4 if rand(100) == 1 && $game_variables[256]==(:LCLOAK)#take from saturation
	end

	
  def pbchangeStamina
	if PBDayNight.isDay?(pbGetTimeNow)
	   $Trainer.playermaxstamina=75+$Trainer.playerstaminamod
	end
	if PBDayNight.isMorning?(pbGetTimeNow)
	   $Trainer.playermaxstamina=60+$Trainer.playerstaminamod
	end
	if PBDayNight.isAfternoon?(pbGetTimeNow)
	   $Trainer.playermaxstamina=45+$Trainer.playerstaminamod
	end
	if PBDayNight.isEvening?(pbGetTimeNow)
	   $Trainer.playermaxstamina=40+$Trainer.playerstaminamod
	end
	if PBDayNight.isNight?(pbGetTimeNow)
	   $Trainer.playermaxstamina=25+$Trainer.playerstaminamod
	end
    if $Trainer.playerstamina < 0
	   $Trainer.playerstamina=0
	end
	if $Trainer.playerstamina > $Trainer.playermaxstamina
	   $Trainer.playerstamina = $Trainer.playermaxstamina
	end
	if $game_player.pbCanRun?
	   $Trainer.playerstamina-=1 if rand(25) == 1
	else
	   $Trainer.playerstamina+=3 if rand(50) == 1
	end
end








  def pbchangeHealth
    if $Trainer.playerhealth < 0
	   $Trainer.playerhealth=0
	end
	if $game_variables[256]==(:IRONARMOR)
	    if $Trainer.playerhealth>150
         $Trainer.playerhealth=150
		end
		
    else 
	  if $Trainer.playerhealth>100
        $Trainer.playerhealth=100 
	   end
	end
  end


def pbLifeCheck
   data = EliteBattle.get_data(:NUZLOCKE, :Metrics, :RULES); data = [] if data.nil?
 if $PokemonSystem.survivalmode = 0 && $game_variables[204]==2 && (EliteBattle.get(:nuzlocke) && (data.include?(:NOREVIVE) || data.include?(:PERMADEATH)))
   Kernel.pbMessage(_INTL("Ah. "))
   Kernel.pbMessage(_INTL("I see. "))
   Kernel.pbMessage(_INTL("You are in it for the challenge. "))
   Kernel.pbMessage(_INTL("By doing this, you not only put yourself at risk. "))
   Kernel.pbMessage(_INTL("but you risk your own POKeMON too. "))
   Kernel.pbMessage(_INTL("I bring you another choice. "))
   Kernel.pbMessage(_INTL("You may also enable POKeMON needing to eat and drink. "))
   Kernel.pbMessage(_INTL("Pokemon will age, and they may die from that. "))
   Kernel.pbMessage(_INTL("Their Life expectancy is entirely based on their hardships. "))
   message=_INTL("Do you wish to activate Pokemon Survival Mode?")
    if pbConfirmMessage(message)
	      Kernel.pbMessage(_INTL("You cannot come to terms with this from the Menu. "))
		  Kernel.pbMessage(_INTL("Your choice is made. "))
		  $game_switches[75]=true
	else
		  Kernel.pbMessage(_INTL("Understandable. "))
	end
end
end
	
	
	
	
def pbLifeCheckChecking
  if $game_switches[75]==true
     return true
  else
     return false
end
end
	
	
	
#  if pbLifeCheckChecking == true
#    pkmn.food = (rand(100)+1)
#    pkmn.water = (rand(100)+1)
#    pkmn.sleep = (rand(40)+1)
#  end
	
def pbPokeAging(pkmn)
   oldtimenow=0
   timenow=0
   time=0
  oldtimenow = timenow
  timenow = pbGetTimeNow.to_i
   time = timenow-oldtimenow
   if time >= 11059200 && !timenow=0 && !pkmn.egg?
     pkmn.sleep+=1
   end
   if pkmn.sleep >=180
     pkmn.permadeath=true
   end
end