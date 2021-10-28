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
#It will run just fine like this, but you can also crack open "PField_Visuals" #
#and around line 634 you will find "def pbStartOver"                           #
#You can add                                                                   #
#                                                                              #
#  if $Trainer.money < 5 || $PokemonSystem.survivalmode == 0                         #
#      pbMessage(_INTL("\\w[]\\wm\\c[8]\\l[3]Game Over"))                      #
#      pbCancelVehicles                                                        #
#      pbRemoveDependencies()                                                  #
#      pbEndGame                                                               #
#      return                                                                  #
#  end                                                                         #
#To make this script activate upon loss.                                       #
#Player Health in this script is regarded as the Trainer.money, as that is     #
#what it was in Pokemon Survival Island, I am absolutely positive variables    #
#can be used instead. I used:                                                  #
#------------------------------------------------------------------------------#
# $game_switches[54] for the Survival Mode Switch, and put it in the options   #
# menu personally.                                                             #
#------------------------------------------------------------------------------#
# $game_variables[208] what I used to track sleep.                             #
#------------------------------------------------------------------------------#
# $game_variables[247] also related to sleep, due to my Game using FLs Unreal  #
#Time, I gave the option to sleep X amount of hours using an Input Number menu,#
#it could be done without FLs perhaps?                                         #
#Honestly, never not had Unreal Time in my game to know.                       #
#If it's a problem, tab it out, RAGECANDYBAR,LEMONADE,SODAPOP, and SWEETHEART  #
#all restore Sleep.                                                            #
#------------------------------------------------------------------------------#
# $game_variables[205] is Maurili's hunger.                                    #
#------------------------------------------------------------------------------#
# $game_variables[206] is thirst.                                              #
#------------------------------------------------------------------------------#
# $game_variables[207] is Maurili's Saturation.                                #
#------------------------------------------------------------------------------#
# $game_variables[247] is the variable I used to restore sleep.                #
#------------------------------------------------------------------------------#
# $game_switch[249] is used to give a one time message about starving,         #
#then turn itself off to take away health.                                     #
# This has to be placed at the start of your game.                             #
#------------------------------------------------------------------------------#
# Again, $Trainer.money is used as health by default.                          #
#------------------------------------------------------------------------------#
# I used the Trainer Card to display all this information.                     #
#------------------------------------------------------------------------------#
#Beyond that, the Eating and Drinking (pbFillUp) and Medicine (pbMedicine)     #
#scripts could be attached to anything, I attached them to items called        #
#"Medicine Bag" and "Food Bag"                                                 #
#------------------------------------------------------------------------------#
#At the bottom is "pbEndGame"                                                  #
#     This should lead to a map with an autorun event that has:                #
#                                                                              #
#$scene = pbCallTitle                                                          #
#    while $scene != nil                                                       #
#      $scene.main                                                             #
#    end                                                                       #
#    Graphics.transition(20)                                                   #
# As it's script. I do not know if it still functions in 18.1, as I have not   #
#tested it, but End Games function is to well                                  #
#Cause a game over.                                                            #
#------------------------------------------------------------------------------#
#When I learn how to, I will make customizable fill ins.                       #
#------------------------------------------------------------------------------#
#Installation:                                                                 #
#I don't think it particularly has to be anywhere, mine is a good bit          #
#above main to little issue.                                                   #
#------------------------------------------------------------------------------#
#                                                                              #
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#

maps = [322,333,334,335,336]
Events.onStepTakenTransferPossible+=proc {

if $game_variables[256]==(:SSHIRT) 
 if $game_variables[205]>150
  $game_variables[205]=150  #food
  $game_switches[250]=true
 end
else
 if $game_variables[205]>100
  $game_variables[205]=100 
  $game_switches[250]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $game_variables[206]>150
  $game_variables[206]=150  #thirst
  $game_switches[273]=true
 end
else
 if $game_variables[206]>100
   $game_variables[206]=100 
   $game_switches[273]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $game_variables[207]>75
  $game_variables[207]=75
 end
else
 if $game_variables[207]>100 #Saturation
  $game_variables[207]=100 
 end
end
 
if $game_variables[256]==(:SSHIRT) 
 if $game_variables[208]>150
  $game_variables[208]=150 
  $game_switches[249]=true
 end
else
 if $game_variables[208]>200
  $game_variables[208]=200  #sleep
  $game_switches[249]=true
 end
end

if $game_variables[205]<0
  $game_variables[205]=0 
end

if $game_variables[206]<0
  $game_variables[206]=0 
end

if $game_variables[207]<0
 $game_variables[207]=0 
 $game_switches[273]=true
end
 
if $game_variables[208]<0
 $game_variables[208]=0 
 $game_switches[249]=true
end

if $Trainer.money>100
 $Trainer.money=100 
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[208]
  when 0
   if $game_switches[249]==true
    pbMessage(_INTL("You are passing out from lack of sleep!"))
	Achievements.incrementProgress("INSOMNIA",1)
    $Trainer.money -= 5
    $game_switches[249]=false
   else
    $Trainer.money -= 5
   end
  else
   $game_variables[208] -= 1 if rand(50) == 1 #take from sleep
end
end


if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) && $game_switches[147]==true #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] -= 1 if rand(50) == 1 #take from hunger
    $game_variables[206] -= 1 if rand(50) == 1 #take from drinking
  else
   $game_variables[207] -= 1 if rand(50) == 1 #take from saturation
end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LCLOAK) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] += 1 if rand(50) == 1 #take from hunger
    $game_variables[206] += 1 if rand(50) == 1 #take from drinking
  else
   $game_variables[207] -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:SEASHOES) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] -= 1 if rand(50) == 1 #take from hunger
    $game_variables[206] += 1 if rand(50) == 1 #take from drinking
  else
   $game_variables[207] -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LJACKET) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] += 1 if rand(50) == 1 #take from hunger
    $game_variables[206] -= 1 if rand(50) == 1 #take from drinking
  else
   $game_variables[207] -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:IRONARMOR) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] -= 1 if rand(50) == 1 #take from hunger
    $game_variables[206] -= 1 if rand(50) == 1 #take from drinking
  else
   $game_variables[207] -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id)#Survival Mode Switch
  case $game_variables[205]
   when 0
    if $game_switches[250]==true
      pbMessage(_INTL("You are passing out from lack of food!"))
	  Achievements.incrementProgress("STARVING",1)
      $Trainer.money -= 5
      $game_switches[250]=false
    else
      $Trainer.money -= 5
   end
end
end

if $PokemonSystem.survivalmode == 0 #Survival Mode Switch
  case $game_variables[206]
   when 0
    if $game_switches[273]==true
      pbMessage(_INTL("You are passing out from lack of water!"))
	  Achievements.incrementProgress("THIRSTY",1)
      $Trainer.money -= 5
      $game_switches[273]=false
    else
      $Trainer.money -= 5
   end
end
end    

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end

if $Trainer.money < 1 && $PokemonSystem.survivalmode == 0
    pbMessage(_INTL("\\w[]\\wm\\c[8]\\l[3]Game Over"))
    pbCancelVehicles
    pbRemoveDependencies 
    pbEndGame
    return
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
 if $game_variables[208]<100
  $game_variables[208]=$game_variables[208]+($game_variables[247]*6)
 end
end

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
$game_variables[205]+=4
$game_variables[207]+=3
$game_variables[206]+=1
$Trainer.money += 1
elsif berry == :LEPPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :CHERIBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :CHESTOBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :PECHABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :RAWSTBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :ASPEARBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :PERSIMBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :LUMBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :FIGYBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :WIKIBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :MAGOBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :AGUAVBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :IAPAPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :IAPAPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :SITRUSBERRY
$game_variables[205]+=5
$game_variables[207]+=7
$game_variables[206]+=1
$Trainer.money += (0.25*$Trainer.money)
elsif berry == :BERRYJUICE
$game_variables[205]+=6
$game_variables[207]+=4
$game_variables[206]+=4
$Trainer.money += 2
elsif berry == :FRESHWATER
$game_variables[206]+=20
$game_variables[207]+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SATKCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SPEEDCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SPDEFCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :ACCCURRY
$game_variables[205]+=8
$game_variables[207]+=12
$game_variables[206]-=7
elsif berry == :DEFCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :CRITCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :GSCURRY
$game_variables[205]+=8#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$game_variables[205]+=10
$game_variables[207]+=3
$game_variables[208]+=7
elsif berry == :SWEETHEART #chocolate
$game_variables[205]+=10#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[208]+=6#208 is Sleep
elsif berry == :SODAPOP
$game_variables[206]-=11#206 is Thirst
$game_variables[207]+=11#207 is Saturation
$game_variables[208]+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$game_variables[207]+=11#207 is Saturation
$game_variables[206]+=10#206 is Thirst
$game_variables[208]+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$game_variables[207]+=20#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$game_variables[207]+=10
$game_variables[206]+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$game_variables[207]+=10#207 is Saturation
$game_variables[205]+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=4#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif berry == :APPLE
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :CHOCOLATE
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=7#205 is Hunger
elsif berry == :LEMON
$game_variables[207]+=3#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=4#205 is Hunger
elsif berry == :OLDGATEAU
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=3#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :CASTELIACONE
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif berry == :BIGMALASADA
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif berry == :ONION
$game_variables[207]+=5#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :COOKEDORAN
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=6#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :CARROT
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :BREAD
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=11#205 is Hunger
elsif berry == :TEA
$game_variables[207]+=8#207 is Saturation
$game_variables[206]+=8#206 is Thirst
$game_variables[205]+=2#205 is Hunger
elsif berry == :CARROTCAKE
$game_variables[207]+=15#207 is Saturation
$game_variables[206]+=15#206 is Thirst
$game_variables[205]+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$game_variables[207]+=40#207 is Saturation
$game_variables[206]+=0#206 is Thirst
$game_variables[205]+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$game_variables[207]+=20#207 is Saturation
$game_variables[206]+=25#206 is Thirst
$game_variables[205]+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$game_variables[207]+=5#207 is Saturation
$game_variables[206]+=5#206 is Thirst
$game_variables[205]+=5#205 is Hunger


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
 Kernel.pbMessage(_INTL("Sleep: {1}, Food: {2}, Water: {3}. ",$game_variables[208],$game_variables[205],$game_variables[206]))
 if pbConfirmMessage(message)
   $PokemonBag.pbDeleteItem(berry,1)
   if berry == :ORANBERRY
$game_variables[205]+=4
$game_variables[207]+=3
$game_variables[206]+=1
$Trainer.money += 1
elsif berry == :LEPPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :CHERIBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :CHESTOBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :PECHABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :RAWSTBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :ASPEARBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :PERSIMBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :LUMBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :FIGYBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :WIKIBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :MAGOBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :AGUAVBERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :IAPAPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :IAPAPABERRY
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif berry == :SITRUSBERRY
$game_variables[205]+=5
$game_variables[207]+=7
$game_variables[206]+=1
$Trainer.money += (0.25*$Trainer.money)
elsif berry == :BERRYJUICE
$game_variables[205]+=6
$game_variables[207]+=4
$game_variables[206]+=4
$Trainer.money += 2
elsif berry == :FRESHWATER
$game_variables[206]+=25
$game_variables[207]+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SATKCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SPEEDCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :SPDEFCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :ACCCURRY
$game_variables[205]+=8
$game_variables[207]+=12
$game_variables[206]-=7
elsif berry == :DEFCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :CRITCURRY
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif berry == :GSCURRY
$game_variables[205]+=8#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$game_variables[205]+=10
$game_variables[207]+=3
$game_variables[208]+=7
elsif berry == :SWEETHEART #chocolate
$game_variables[205]+=10#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[208]+=6#208 is Sleep
elsif berry == :SODAPOP
$game_variables[206]-=11#206 is Thirst
$game_variables[207]+=11#207 is Saturation
$game_variables[208]+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$game_variables[207]+=11#207 is Saturation
$game_variables[206]+=15#206 is Thirst
$game_variables[208]+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$game_variables[207]+=20#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$game_variables[207]+=20
$game_variables[206]+=7
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$game_variables[207]+=10#207 is Saturation
$game_variables[205]+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=4#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif berry == :APPLE
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :CHOCOLATE
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=7#205 is Hunger
elsif berry == :LEMON
$game_variables[207]+=3#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=4#205 is Hunger
elsif berry == :OLDGATEAU
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=3#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :CASTELIACONE
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif berry == :BIGMALASADA
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif berry == :ONION
$game_variables[207]+=5#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :COOKEDORAN
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=6#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif berry == :CARROT
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif berry == :BREAD
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=11#205 is Hunger
elsif berry == :TEA
$game_variables[207]+=8#207 is Saturation
$game_variables[206]+=8#206 is Thirst
$game_variables[205]+=2#205 is Hunger
elsif berry == :CARROTCAKE
$game_variables[207]+=15#207 is Saturation
$game_variables[206]+=15#206 is Thirst
$game_variables[205]+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$game_variables[207]+=40#207 is Saturation
$game_variables[206]+=0#206 is Thirst
$game_variables[205]+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$game_variables[207]+=20#207 is Saturation
$game_variables[206]+=25#206 is Thirst
$game_variables[205]+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$game_variables[207]+=5#207 is Saturation
$game_variables[206]+=5#206 is Thirst
$game_variables[205]+=5#205 is Hunger


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


def pbMedicine
medicine=0
pbFadeOutIn(99999){
scene = PokemonBag_Scene.new
screen = PokemonBagScreen.new(scene,$PokemonBag)
medicine = screen.pbChooseItemScreen(Proc.new { |item| GameData::Item.get(item).is_medicine? })
}
if medicine
$PokemonBag.pbDeleteItem(medicine,1)
Kernel.pbMessage(_INTL("You consume the {1}. ",GameData::Item.get(medicine).name))
#205 is Hunger, 207 is Saturation, 206 is Thirst, 208 is Sleep
if medicine == :POTION
$Trainer.money += 20
elsif medicine == :SUPERPOTION
$Trainer.money += 40
elsif medicine == :HYPERPOTION
$Trainer.money += 60
elsif medicine == :FULLRESTORE
$Trainer.money += 100
#full belly
end
end
end 

def pbEndGame
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