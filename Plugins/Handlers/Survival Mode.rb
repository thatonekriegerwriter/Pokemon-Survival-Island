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
    $game_variables[205] -= 1 if rand(10) == 5 #take from hunger
    $game_variables[206] -= 1 if rand(10) == 5 #take from drinking
  else
   $game_variables[207] -= 1 if rand(10) == 5 #take from saturation
end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LCLOAK) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] += 1 if rand(10) == 5 #take from hunger
    $game_variables[206] += 1 if rand(10) == 5 #take from drinking
  else
   $game_variables[207] -= 1 if rand(10) == 5 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:SEASHOES) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] -= 1 if rand(10) == 5 #take from hunger
    $game_variables[206] += 1 if rand(10) == 5 #take from drinking
  else
   $game_variables[207] -= 1 if rand(10) == 5 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LJACKET) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] += 1 if rand(10) == 5 #take from hunger
    $game_variables[206] -= 1 if rand(10) == 5 #take from drinking
  else
   $game_variables[207] -= 1 if rand(10) == 5 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:IRONARMOR) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $game_variables[207]
  when 0
    $game_variables[205] -= 1 if rand(10) == 5 #take from hunger
    $game_variables[206] -= 1 if rand(10) == 5 #take from drinking
  else
   $game_variables[207] -= 1 if rand(10) == 5 #take from saturation
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

if $PokemonSystem.survivalmode == 0 && $PokemonSystem.temperature == 0 && GameData::MapMetadata.get($game_map.map_id).outdoor_map

  if pbIsSpring == true
   $game_screen.weather(:Rain, 9, 20)  if rand(200) <= 25
   $game_variables[387] += 0 if rand(10) == 5 #ambienttemperature
  end

  if pbIsSummer == true
   $game_screen.weather(:Sun, 9, 20)  if rand(200) <= 50 && !($game_screen.weather_type==:Rain)
   $game_variables[387] += 3 if rand(10) == 5 #ambienttemperature
  end

  if pbIsAutumn  == true
   $game_screen.weather(:Rain, 9, 20)  if rand(200) <= 25
   $game_screen.weather(:HeavyRain, 9, 20) if rand(200) <= 15
   $game_variables[387] -= 2 if rand(40) == 5 #ambienttemperature
  end

  if pbIsWinter  == true
   $game_screen.weather(:Snow, 9, 20) if rand(200) <= 40 && !($game_screen.weather_type==:Blizzard)
   $game_screen.weather(:Blizzard, 9, 20) if rand(200) <= 15 && !($game_screen.weather_type==:Snow)
   $game_variables[387] -= 4 if rand(20) == 5 #ambienttemperature
   if ($game_screen.weather_type==:Rain)
      $game_screen.weather(:Snow, 9, 20) if rand(200) <= 40 && !($game_screen.weather_type==:Blizzard)
  	  $game_screen.weather(:Blizzard, 9, 20) if rand(200) <= 15 && !($game_screen.weather_type==:Snow)
  end

end
=begin
 case $game_variables[384] #Month
   when 0 #Jan
   when 1 #Feb
   when 2 #Mar
   when 3 #April
   when 4 #may
    $game_variables[387] += 0 if rand(10) == 5 #ambienttemperature
   when 5 #june
    $game_variables[387] += 3 if rand(10) == 5 #ambienttemperature
   when 6 #july
    $game_variables[387] -= 2 if rand(40) == 5 #ambienttemperature
   when 7 #august
    $game_variables[387] -= 4 if rand(20) == 5 #ambienttemperature
   when 8 #september
    $game_variables[387] += 0 if rand(10) == 5 #ambienttemperature
   when 9 #october
    $game_variables[387] += 3 if rand(10) == 5 #ambienttemperature
   when 10 #november
    $game_variables[387] -= 2 if rand(40) == 5 #ambienttemperature
   when 11 #december
    $game_variables[387] -= 4 if rand(20) == 5 #ambienttemperature
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
=end
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
berry = screen.pbChooseItemScreen(Proc.new { |item| GameData::Item.get(item).is_foodwater? || GameData::Item.get(item).is_berry?(item) })
}
if berry
$PokemonBag.pbDeleteItem(berry,1)
Kernel.pbMessage(_INTL("You consume the {1}. ",GameData::Item.get(berry).name))
#205 is Hunger, 207 is Saturation, 206 is Thirst, 208 is Sleep
if hasConst?(berry,(:ORANBERRY))
$game_variables[205]+=4
$game_variables[207]+=3
$game_variables[206]+=1
$Trainer.money += 1
elsif hasConst?(berry,(:LEPPABERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:CHERIBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:CHESTOBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:PECHABERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:RAWSTBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:ASPEARBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:PERSIMBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:LUMBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:FIGYBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:WIKIBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:MAGOBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:AGUAVBERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:IAPAPABERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:IAPAPABERRY))
$game_variables[205]+=5
$game_variables[207]+=2
$game_variables[206]+=2
elsif hasConst?(berry,(:SITRUSBERRY))
$game_variables[205]+=5
$game_variables[207]+=7
$game_variables[206]+=1
$Trainer.money += (0.25*$Trainer.money)
elsif hasConst?(berry,(:BERRYJUICE))
$game_variables[205]+=6
$game_variables[207]+=4
$game_variables[206]+=4
$Trainer.money += 2
elsif hasConst?(berry,(:FRESHWATER))
$game_variables[206]+=20
$game_variables[207]+=10#207 is Saturation
#You can add more if you want
elsif hasConst?(berry,(:ATKCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:SATKCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:SPEEDCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:SPDEFCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:ACCCURRY))
$game_variables[205]+=8
$game_variables[207]+=12
$game_variables[206]-=7
elsif hasConst?(berry,(:DEFCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:CRITCURRY))
$game_variables[205]+=8
$game_variables[207]+=15
$game_variables[206]-=7
elsif hasConst?(berry,(:GSCURRY))
$game_variables[205]+=8#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=7#206 is Thirst
elsif hasConst?(berry,(:RAGECANDYBAR)) #chocolate
$game_variables[205]+=10
$game_variables[207]+=3
$game_variables[208]+=7
elsif hasConst?(berry,(:SWEETHEART)) #chocolate
$game_variables[205]+=10#205 is Hunger
$game_variables[207]+=5#207 is Saturation
$game_variables[208]+=6#208 is Sleep
elsif hasConst?(berry,(:SODAPOP))
$game_variables[206]-=11#206 is Thirst
$game_variables[207]+=11#207 is Saturation
$game_variables[208]+=10#208 is Sleep
elsif hasConst?(berry,(:LEMONADE))
$game_variables[207]+=11#207 is Saturation
$game_variables[206]+=7#206 is Thirst
$game_variables[208]+=7#208 is Sleep
elsif hasConst?(berry,(:HONEY))
$game_variables[207]+=20#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif hasConst?(berry,(:MOOMOOMILK))
$game_variables[207]+=10
$game_variables[206]+=7
elsif hasConst?(berry,(:CSLOWPOKETAIL))
$game_variables[207]+=10#207 is Saturation
$game_variables[205]+=10#205 is Hunger
elsif hasConst?(berry,(:BAKEDPOTATO))
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=4#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif hasConst?(berry,(:APPLE))
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif hasConst?(berry,(:CHOCOLATE))
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=7#205 is Hunger
elsif hasConst?(berry,(:LEMON))
$game_variables[207]+=3#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=4#205 is Hunger
elsif hasConst?(berry,(:OLDGATEAU))
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=2#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif hasConst?(berry,(:LAVACOOKIE))
$game_variables[207]+=5#207 is Saturation
$game_variables[206]-=3#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif hasConst?(berry,(:CASTELIACONE))
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=7#205 is Hunger
elsif hasConst?(berry,(:LUMIOSEGALETTE))
$game_variables[207]+=5#207 is Saturation
$game_variables[205]+=6#205 is Hunger
elsif hasConst?(berry,(:SHALOURSABLE))
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif hasConst?(berry,(:BIGMALASADA))
$game_variables[207]+=8#207 is Saturation
$game_variables[205]+=8#205 is Hunger
elsif hasConst?(berry,(:ONION))
$game_variables[207]+=5#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif hasConst?(berry,(:COOKEDORAN))
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=6#206 is Thirst
$game_variables[205]+=6#205 is Hunger
elsif hasConst?(berry,(:CARROT))
$game_variables[207]+=6#207 is Saturation
$game_variables[206]+=3#206 is Thirst
$game_variables[205]+=3#205 is Hunger
elsif hasConst?(berry,(:BREAD))
$game_variables[207]+=10#207 is Saturation
$game_variables[206]+=7#206 is Thirst
$game_variables[205]+=11#205 is Hunger
elsif hasConst?(berry,(:TEA))
$game_variables[207]+=8#207 is Saturation
$game_variables[206]+=8#206 is Thirst
$game_variables[205]+=2#205 is Hunger
elsif hasConst?(berry,(:CARROTCAKE))
$game_variables[207]+=15#207 is Saturation
$game_variables[206]+=15#206 is Thirst
$game_variables[205]+=10#205 is Hunger


#inedible
elsif hasConst?(berry,(:TEALEAF))
$PokemonBag.pbStoreItem(:TEALEAF,1)
elsif hasConst?(berry,(:COCOABEAN))
$PokemonBag.pbStoreItem(:COCOABEAN,1)
elsif hasConst?(berry,(:SUGARCANE))
$PokemonBag.pbStoreItem(:SUGARCANE,1)
elsif hasConst?(berry,(:BAIT))
$PokemonBag.pbStoreItem(:BAIT,1)
elsif hasConst?(berry,(:TREE))
$PokemonBag.pbStoreItem(:TREE,1)
elsif hasConst?(berry,(:REDAPRICORN))
$PokemonBag.pbStoreItem(:REDAPRICORN,1)
elsif hasConst?(berry,(:PINKAPRICORN))
$PokemonBag.pbStoreItem(:PINKAPRICORN,1)
elsif hasConst?(berry,(:BLUEAPRICORN))
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif hasConst?(berry,(:WHITEAPRICORN))
$PokemonBag.pbStoreItem(:WHITEAPRICORN,1)
elsif hasConst?(berry,(:YELLOWAPRICORN))
$PokemonBag.pbStoreItem(:YELLOWAPRICORN,1)
elsif hasConst?(berry,(:BLACKAPRICORN))
$PokemonBag.pbStoreItem(:BLACKAPRICORN,1)
elsif hasConst?(berry,(:PURPLEAPRICORN))
$PokemonBag.pbStoreItem(:PURPLEAPRICORN,1)
elsif hasConst?(berry,(:POWERHERB))
$PokemonBag.pbStoreItem(:POWERHERB,1)
#full belly
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
if hasConst?(medicine,(:POTION))
$Trainer.money += 20
elsif hasConst?(medicine,(:SUPERPOTION))
$Trainer.money += 40
elsif hasConst?(medicine,(:HYPERPOTION))
$Trainer.money += 60
elsif hasConst?(medicine,(:FULLRESTORE))
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


