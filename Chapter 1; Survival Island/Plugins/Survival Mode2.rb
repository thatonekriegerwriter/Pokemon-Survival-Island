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
maps = [322,333,334,335,336]
Events.onStepTakenTransferPossible+=proc {

if $game_variables[256]==(:SSHIRT) 
 if $Trainer.playerfood>150
  $Trainer.playerfood=150  #food
  $game_switches[250]=true
 end
else
 if $Trainer.playerfood>100
  $Trainer.playerfood=100 
  $game_switches[250]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $Trainer.playerwater>150
  $Trainer.playerwater=150  #thirst
  $game_switches[273]=true
 end
else
 if $Trainer.playerwater>100
   $Trainer.playerwater=100 
   $game_switches[273]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $Trainer.playersaturation>75
  $Trainer.playersaturation=75
 end
else
 if $Trainer.playersaturation>100 #Saturation
  $Trainer.playersaturation=100 
 end
end
 
if $game_variables[256]==(:SSHIRT) 
 if $Trainer.playersleep>150
  $Trainer.playersleep=150 
  $game_switches[249]=true
 end
else
 if $Trainer.playersleep>200
  $Trainer.playersleep=200  #sleep
  $game_switches[249]=true
 end
end

if $Trainer.playerfood<0
  $Trainer.playerfood=0 
end

if $Trainer.playerwater<0
  $Trainer.playerwater=0 
end

if $Trainer.playersaturation<0
 $Trainer.playersaturation=0 
 $game_switches[273]=true
end
 
if $Trainer.playersleep<0
 $Trainer.playersleep=0 
 $game_switches[249]=true
end
if $Trainer.playerhealth>100
 $Trainer.playerhealth=100 
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $Trainer.playersleep
  when 0
   if $game_switches[249]==true
    pbMessage(_INTL("You are passing out from lack of sleep!"))
	Achievements.incrementProgress("INSOMNIA",1)
    $Trainer.playerhealth -= 5
    $game_switches[249]=false
   else
    $Trainer.playerhealth -= 5
   end
  else
   $Trainer.playersleep -= 1 if rand(50) == 1 #take from sleep
end
end


if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) && $game_switches[147]==true #Survival Mode Switch
 case $Trainer.playersaturation
  when 0
    $Trainer.playerfood -= 1 if rand(50) == 1 #take from hunger
    $Trainer.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $Trainer.playersaturation -= 1 if rand(50) == 1 #take from saturation
end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LCLOAK) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $Trainer.playersaturation
  when 0
    $Trainer.playerfood += 1 if rand(50) == 1 #take from hunger
    $Trainer.playerwater += 1 if rand(50) == 1 #take from drinking
  else
   $Trainer.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:SEASHOES) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $Trainer.playersaturation
  when 0
    $Trainer.playerfood -= 1 if rand(50) == 1 #take from hunger
    $Trainer.playerwater += 1 if rand(50) == 1 #take from drinking
  else
   $Trainer.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LJACKET) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $Trainer.playersaturation
  when 0
    $Trainer.playerfood += 1 if rand(50) == 1 #take from hunger
    $Trainer.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $Trainer.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:IRONARMOR) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $Trainer.playersaturation
  when 0
    $Trainer.playerfood -= 1 if rand(50) == 1 #take from hunger
    $Trainer.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $Trainer.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id)#Survival Mode Switch
  case $Trainer.playerfood
   when 0
    if $game_switches[250]==true
      pbMessage(_INTL("You are passing out from lack of food!"))
	  Achievements.incrementProgress("STARVING",1)
      $Trainer.playerhealth -= 5
      $game_switches[250]=false
    else
      $Trainer.playerhealth -= 5
   end
end
end

if $PokemonSystem.survivalmode == 0 #Survival Mode Switch
  case $Trainer.playerwater
   when 0
    if $game_switches[273]==true
      pbMessage(_INTL("You are passing out from lack of water!"))
	  Achievements.incrementProgress("THIRSTY",1)
      $Trainer.playerhealth -= 5
      $game_switches[273]=false
    else
      $Trainer.playerhealth -= 5
   end
end
end    

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end
if $Trainer.playerhealth < 1 && $PokemonSystem.survivalmode == 0
  pbStartOver
 end 
}

Events.onMapChanging  += proc {

#------------------------------------------------------------------------------#
#--------------------------Temperature                 ------------------------#
#------------------------------------------------------------------------------#


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


def pbSleepRestore
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
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#


def pbRandomEvent
   if rand(1000) == 1
     Kernel.pbMessage(_INTL("There was a sound outside."))   #Comet
     $game_switches[450]==true 
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
       $PokemonBag.pbDeleteItem(:WATERBOTTLE,1)
	end
	next 4
   else
    Kernel.pbMessage(_INTL("That is not water."))
	next 0
end
})












#Eating Food
def pbFillUp
berry=0
pbFadeOutIn(99999){
scene = PokemonBag_Scene.new
screen = PokemonBagScreen.new(scene,$PokemonBag)
berry = screen.pbChooseItemScreen(Proc.new { |item| GameData::Item.get(item).is_foodwater? || GameData::Item.get(item).is_berry?})
}
if berry
$PokemonBag.pbDeleteItem(berry,1)
Kernel.pbMessage(_INTL("You use the {1}. ",GameData::Item.get(berry).name))
#205 is Hunger, 207 is Saturation, 206 is Thirst, 208 is Sleep
if berry == :ORANBERRY
$Trainer.playerfood+=4
$Trainer.playersaturation+=3
$Trainer.playerwater+=1
$Trainer.playerhealth += 1
elsif berry == :LEPPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :CHERIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :CHESTOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :PECHABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :RAWSTBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :ASPEARBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :PERSIMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :LUMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :FIGYBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :WIKIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :MAGOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :AGUAVBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :SITRUSBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=7
$Trainer.playerwater+=1
$Trainer.playerhealth += (0.25*$Trainer.playerhealth)
elsif berry == :BERRYJUICE
$Trainer.playerfood+=6
$Trainer.playersaturation+=4
$Trainer.playerwater+=4
$Trainer.playerhealth += 2
elsif berry == :FRESHWATER
$Trainer.playerwater+=10
$Trainer.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SPEEDCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SPDEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :ACCCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=12
$Trainer.playerwater-=7
elsif berry == :DEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :CRITCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :GSCURRY
$Trainer.playerfood+=8#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$Trainer.playerfood+=10
$Trainer.playersaturation+=3
$Trainer.playersleep+=7
elsif berry == :SWEETHEART #chocolate
$Trainer.playerfood+=10#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playersleep+=6#208 is Sleep
elsif berry == :SODAPOP
$Trainer.playerwater-=11#206 is Thirst
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playersleep+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playerwater+=10#206 is Thirst
$Trainer.playersleep+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$Trainer.playersaturation+=10
$Trainer.playerwater+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerfood+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=4#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :APPLE
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :CHOCOLATE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :LEMON
$Trainer.playersaturation+=3#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=4#205 is Hunger
elsif berry == :OLDGATEAU
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=3#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :CASTELIACONE
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
elsif berry == :BIGMALASADA
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
elsif berry == :ONION
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :COOKEDORAN
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=6#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :CARROT
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :BREAD
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=11#205 is Hunger
elsif berry == :TEA
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerwater+=8#206 is Thirst
$Trainer.playerfood+=2#205 is Hunger
elsif berry == :CARROTCAKE
$Trainer.playersaturation+=15#207 is Saturation
$Trainer.playerwater+=15#206 is Thirst
$Trainer.playerfood+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$Trainer.playersaturation+=40#207 is Saturation
$Trainer.playerwater+=0#206 is Thirst
$Trainer.playerfood+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=25#206 is Thirst
$Trainer.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=5#206 is Thirst
$Trainer.playerfood+=5#205 is Hunger


#inedible
elsif berry == :TEALEAF
$PokemonBag.pbStoreItem(:TEALEAF,1)
elsif berry == :COCOABEAN
$PokemonBag.pbStoreItem(:COCOABEAN,1)
elsif berry == :SUGARCANE
$PokemonBag.pbStoreItem(:SUGARCANE,1)
elsif berry == :BAIT
$PokemonBag.pbStoreItem(:BAIT,1)
elsif berry == :TREE
$PokemonBag.pbStoreItem(:TREE,1)
elsif berry == :REDAPRICORN
$PokemonBag.pbStoreItem(:REDAPRICORN,1)
elsif berry == :PINKAPRICORN
$PokemonBag.pbStoreItem(:PINKAPRICORN,1)
elsif berry == :BLUEAPRICORN
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif berry == :WHITEAPRICORN
$PokemonBag.pbStoreItem(:WHITEAPRICORN,1)
elsif berry == :YELLOWAPRICORN
$PokemonBag.pbStoreItem(:YELLOWAPRICORN,1)
elsif berry == :BLACKAPRICORN
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif berry == :PURPLEAPRICORN
$PokemonBag.pbStoreItem(:PURPLEAPRICORN,1)
elsif berry == :POWERHERB
$PokemonBag.pbStoreItem(:POWERHERB,1)
#full belly
end

message=_INTL("Do you want to use {1} again?",GameData::Item.get(berry).name)
loop do
 Kernel.pbMessage(_INTL("Sleep: {1}, Food: {2}, Water: {3}. ",$Trainer.playersleep,$Trainer.playerfood,$Trainer.playerwater))
 if pbConfirmMessage(message)
   $PokemonBag.pbDeleteItem(berry,1)
   if berry == :ORANBERRY
$Trainer.playerfood+=4
$Trainer.playersaturation+=3
$Trainer.playerwater+=1
$Trainer.playerhealth += 1
elsif berry == :LEPPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :CHERIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :CHESTOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :PECHABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :RAWSTBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :ASPEARBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :PERSIMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :LUMBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :FIGYBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :WIKIBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :MAGOBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :AGUAVBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :IAPAPABERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=2
$Trainer.playerwater+=2
elsif berry == :SITRUSBERRY
$Trainer.playerfood+=5
$Trainer.playersaturation+=7
$Trainer.playerwater+=1
$Trainer.playerhealth += (0.25*$Trainer.playerhealth)
elsif berry == :BERRYJUICE
$Trainer.playerfood+=6
$Trainer.playersaturation+=4
$Trainer.playerwater+=4
$Trainer.playerhealth += 2
elsif berry == :FRESHWATER
$Trainer.playerwater+=25
$Trainer.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :WATER
$Trainer.playerwater+=10
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SATKCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SPEEDCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :SPDEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :ACCCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=12
$Trainer.playerwater-=7
elsif berry == :DEFCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :CRITCURRY
$Trainer.playerfood+=8
$Trainer.playersaturation+=15
$Trainer.playerwater-=7
elsif berry == :GSCURRY
$Trainer.playerfood+=8#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$Trainer.playerfood+=10
$Trainer.playersaturation+=3
$Trainer.playersleep+=7
elsif berry == :SWEETHEART #chocolate
$Trainer.playerfood+=10#205 is Hunger
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playersleep+=6#208 is Sleep
elsif berry == :SODAPOP
$Trainer.playerwater-=11#206 is Thirst
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playersleep+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$Trainer.playersaturation+=11#207 is Saturation
$Trainer.playerwater+=15#206 is Thirst
$Trainer.playersleep+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$Trainer.playersaturation+=20
$Trainer.playerwater+=7
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerfood+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=4#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :APPLE
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :CHOCOLATE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :LEMON
$Trainer.playersaturation+=3#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=4#205 is Hunger
elsif berry == :OLDGATEAU
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=2#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater-=3#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :CASTELIACONE
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
elsif berry == :BIGMALASADA
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerfood+=8#205 is Hunger
elsif berry == :ONION
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :COOKEDORAN
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=6#206 is Thirst
$Trainer.playerfood+=6#205 is Hunger
elsif berry == :CARROT
$Trainer.playersaturation+=6#207 is Saturation
$Trainer.playerwater+=3#206 is Thirst
$Trainer.playerfood+=3#205 is Hunger
elsif berry == :BREAD
$Trainer.playersaturation+=10#207 is Saturation
$Trainer.playerwater+=7#206 is Thirst
$Trainer.playerfood+=11#205 is Hunger
elsif berry == :TEA
$Trainer.playersaturation+=8#207 is Saturation
$Trainer.playerwater+=8#206 is Thirst
$Trainer.playerfood+=2#205 is Hunger
elsif berry == :CARROTCAKE
$Trainer.playersaturation+=15#207 is Saturation
$Trainer.playerwater+=15#206 is Thirst
$Trainer.playerfood+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$Trainer.playersaturation+=40#207 is Saturation
$Trainer.playerwater+=0#206 is Thirst
$Trainer.playerfood+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$Trainer.playersaturation+=20#207 is Saturation
$Trainer.playerwater+=25#206 is Thirst
$Trainer.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$Trainer.playersaturation+=5#207 is Saturation
$Trainer.playerwater+=5#206 is Thirst
$Trainer.playerfood+=5#205 is Hunger


#inedible
elsif berry == :TEALEAF
$PokemonBag.pbStoreItem(:TEALEAF,1)
elsif berry == :COCOABEAN
$PokemonBag.pbStoreItem(:COCOABEAN,1)
elsif berry == :SUGARCANE
$PokemonBag.pbStoreItem(:SUGARCANE,1)
elsif berry == :BAIT
$PokemonBag.pbStoreItem(:BAIT,1)
elsif berry == :TREE
$PokemonBag.pbStoreItem(:TREE,1)
elsif berry == :REDAPRICORN
$PokemonBag.pbStoreItem(:REDAPRICORN,1)
elsif berry == :PINKAPRICORN
$PokemonBag.pbStoreItem(:PINKAPRICORN,1)
elsif berry == :BLUEAPRICORN
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif berry == :WHITEAPRICORN
$PokemonBag.pbStoreItem(:WHITEAPRICORN,1)
elsif berry == :YELLOWAPRICORN
$PokemonBag.pbStoreItem(:YELLOWAPRICORN,1)
elsif berry == :BLACKAPRICORN
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif berry == :PURPLEAPRICORN
$PokemonBag.pbStoreItem(:PURPLEAPRICORN,1)
elsif berry == :POWERHERB
$PokemonBag.pbStoreItem(:POWERHERB,1)
#full belly
end
 else 
   break
end
end
end
end 