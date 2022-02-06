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
#  if $SurvivalMode.playerhealth < 5 || $PokemonSystem.survivalmode == 0                         #
#      pbMessage(_INTL("\\w[]\\wm\\c[8]\\l[3]Game Over"))                      #
#      pbCancelVehicles                                                        #
#      pbRemoveDependencies()                                                  #
#      pbEndGame                                                               #
#      return                                                                  #
#  end                                                                         #
#To make this script activate upon loss.                                       #
#Player Health in this script is regarded as the $SurvivalMode.playerhealth, as that is     #
#what it was in Pokemon Survival Island, I am absolutely positive variables    #
#can be used instead. I used:                                                  #
#------------------------------------------------------------------------------#
# $game_switches[54] for the Survival Mode Switch, and put it in the options   #
# menu personally.                                                             #
#------------------------------------------------------------------------------#
# $SurvivalMode.playersleep what I used to track sleep.                             #
#------------------------------------------------------------------------------#
# $game_variables[247] also related to sleep, due to my Game using FLs Unreal  #
#Time, I gave the option to sleep X amount of hours using an Input Number menu,#
#it could be done without FLs perhaps?                                         #
#Honestly, never not had Unreal Time in my game to know.                       #
#If it's a problem, tab it out, RAGECANDYBAR,LEMONADE,SODAPOP, and SWEETHEART  #
#all restore Sleep.                                                            #
#------------------------------------------------------------------------------#
# $SurvivalMode.playerfood is Maurili's hunger.                                    #
#------------------------------------------------------------------------------#
# $SurvivalMode.playerwater is thirst.                                              #
#------------------------------------------------------------------------------#
# $SurvivalMode.playersaturation is Maurili's Saturation.                                #
#------------------------------------------------------------------------------#
# $game_variables[247] is the variable I used to restore sleep.                #
#------------------------------------------------------------------------------#
# $game_switch[249] is used to give a one time message about starving,         #
#then turn itself off to take away health.                                     #
# This has to be placed at the start of your game.                             #
#------------------------------------------------------------------------------#
# Again, $SurvivalMode.playerhealth is used as health by default.                          #
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


	




PLAYERSTARTHEALTH = 100
PLAYERSTARTFOOD = 100
PLAYERSTARTWATER = 100
PLAYERSTARTSATURATION = 200
PLAYERSTARTINGSTAMINA = 50
PLAYERSTARTSLEEP = 100


class SurvivalMode
  attr_accessor :survivalmode
  attr_accessor :playerwater  #206
  attr_accessor :playerfood   #205
  attr_accessor :playersleep   #208
  attr_accessor :playersaturation #207
  attr_accessor :playerhealth #225
  attr_accessor :playerstamina

def initialize
    @survivalmode = 1     # Default Survival Mode (0=on, 1=off)
    @playerwater   = PLAYERSTARTWATER     # Text speed (0=slow, 1=normal, 2=fast)
    @playerfood = PLAYERSTARTFOOD     # Battle effects (animations) (0=on, 1=off)
    @playersaturation = PLAYERSTARTSATURATION     # Battle style (0=switch, 1=set)
    @playersleep = PLAYERSTARTSLEEP     # Battle style (0=switch, 1=set)
    @playerhealth  = PLAYERSTARTHEALTH     # Default window frame (see also Settings::MENU_WINDOWSKINS)
    @playerstamina  = PLAYERSTARTINGSTAMINA     # Speech frame
end
end	
	
	

maps = [322,333,334,335,336]
Events.onStepTakenTransferPossible+=proc {

if $game_variables[256]==(:SSHIRT) 
 if $SurvivalMode.playerfood>150
  $SurvivalMode.playerfood=150  #food
  $game_switches[250]=true
 end
else
 if $SurvivalMode.playerfood>100
  $SurvivalMode.playerfood=100 
  $game_switches[250]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $SurvivalMode.playerwater>150
  $SurvivalMode.playerwater=150  #thirst
  $game_switches[273]=true
 end
else
 if $SurvivalMode.playerwater>100
   $SurvivalMode.playerwater=100 
   $game_switches[273]=true
 end
end

if $game_variables[256]==(:SSHIRT) 
 if $SurvivalMode.playersaturation>75
  $SurvivalMode.playersaturation=75
 end
else
 if $SurvivalMode.playersaturation>100 #Saturation
  $SurvivalMode.playersaturation=100 
 end
end
 
if $game_variables[256]==(:SSHIRT) 
 if $SurvivalMode.playersleep>150
  $SurvivalMode.playersleep=150 
  $game_switches[249]=true
 end
else
 if $SurvivalMode.playersleep>200
  $SurvivalMode.playersleep=200  #sleep
  $game_switches[249]=true
 end
end

if $SurvivalMode.playerfood<0
  $SurvivalMode.playerfood=0 
end

if $SurvivalMode.playerwater<0
  $SurvivalMode.playerwater=0 
end

if $SurvivalMode.playersaturation<0
 $SurvivalMode.playersaturation=0 
 $game_switches[273]=true
end
 
if $SurvivalMode.playersleep<0
 $SurvivalMode.playersleep=0 
 $game_switches[249]=true
end
if $SurvivalMode.playerhealth>100
 $SurvivalMode.playerhealth=100 
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $SurvivalMode.playersleep
  when 0
   if $game_switches[249]==true
    pbMessage(_INTL("You are passing out from lack of sleep!"))
	Achievements.incrementProgress("INSOMNIA",1)
    $SurvivalMode.playerhealth -= 5
    $game_switches[249]=false
   else
    $SurvivalMode.playerhealth -= 5
   end
  else
   $SurvivalMode.playersleep -= 1 if rand(50) == 1 #take from sleep
end
end


if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id) && $game_switches[147]==true #Survival Mode Switch
 case $SurvivalMode.playersaturation
  when 0
    $SurvivalMode.playerfood -= 1 if rand(50) == 1 #take from hunger
    $SurvivalMode.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $SurvivalMode.playersaturation -= 1 if rand(50) == 1 #take from saturation
end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LCLOAK) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $SurvivalMode.playersaturation
  when 0
    $SurvivalMode.playerfood += 1 if rand(50) == 1 #take from hunger
    $SurvivalMode.playerwater += 1 if rand(50) == 1 #take from drinking
  else
   $SurvivalMode.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:SEASHOES) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $SurvivalMode.playersaturation
  when 0
    $SurvivalMode.playerfood -= 1 if rand(50) == 1 #take from hunger
    $SurvivalMode.playerwater += 1 if rand(50) == 1 #take from drinking
  else
   $SurvivalMode.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:LJACKET) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $SurvivalMode.playersaturation
  when 0
    $SurvivalMode.playerfood += 1 if rand(50) == 1 #take from hunger
    $SurvivalMode.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $SurvivalMode.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && $game_variables[256]==(:IRONARMOR) && !maps.include?($game_map.map_id) #Survival Mode Switch
 case $SurvivalMode.playersaturation
  when 0
    $SurvivalMode.playerfood -= 1 if rand(50) == 1 #take from hunger
    $SurvivalMode.playerwater -= 1 if rand(50) == 1 #take from drinking
  else
   $SurvivalMode.playersaturation -= 1 if rand(50) == 1 #take from saturation
  end
end

if $PokemonSystem.survivalmode == 0 && !maps.include?($game_map.map_id)#Survival Mode Switch
  case $SurvivalMode.playerfood
   when 0
    if $game_switches[250]==true
      pbMessage(_INTL("You are passing out from lack of food!"))
	  Achievements.incrementProgress("STARVING",1)
      $SurvivalMode.playerhealth -= 5
      $game_switches[250]=false
    else
      $SurvivalMode.playerhealth -= 5
   end
end
end

if $PokemonSystem.survivalmode == 0 #Survival Mode Switch
  case $SurvivalMode.playerwater
   when 0
    if $game_switches[273]==true
      pbMessage(_INTL("You are passing out from lack of water!"))
	  Achievements.incrementProgress("THIRSTY",1)
      $SurvivalMode.playerhealth -= 5
      $game_switches[273]=false
    else
      $SurvivalMode.playerhealth -= 5
   end
end
end    

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end
if $SurvivalMode.playerhealth < 1 && $PokemonSystem.survivalmode == 0
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
 if $SurvivalMode.playersleep<200
  $SurvivalMode.playersleep=$SurvivalMode.playersleep+($game_variables[247]*6)
 end
 if $SurvivalMode.playersaturation<1
   $SurvivalMode.playerfood=$SurvivalMode.playerfood-($game_variables[247]*3)
   $SurvivalMode.playerwater=$SurvivalMode.playerwater-($game_variables[247]*3)
   
  else
   $SurvivalMode.playersaturation=$SurvivalMode.playersaturation-($game_variables[247]*3)
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
$SurvivalMode.playerfood+=4
$SurvivalMode.playersaturation+=3
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += 1
return 1
elsif item == :LEPPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :CHERIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :CHESTOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :PECHABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :RAWSTBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :ASPEARBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :PERSIMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :LUMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :FIGYBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :WIKIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :MAGOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :AGUAVBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
return 1
elsif item == :SITRUSBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=7
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += (0.25*$SurvivalMode.playerhealth)
return 1
elsif item == :BERRYJUICE
$SurvivalMode.playerfood+=6
$SurvivalMode.playersaturation+=4
$SurvivalMode.playerwater+=4
$SurvivalMode.playerhealth += 2
return 1
elsif item == :FRESHWATER
$SurvivalMode.playerwater+=20
$SurvivalMode.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
#You can add more if you want
elsif item == :ATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :SATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :SPEEDCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :SPDEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :ACCCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=12
$SurvivalMode.playerwater-=7
return 1
elsif item == :DEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :CRITCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
return 1
elsif item == :GSCURRY
$SurvivalMode.playerfood+=8#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=7#206 is Thirst
return 1
elsif item == :RAGECANDYBAR #chocolate
$SurvivalMode.playerfood+=10
$SurvivalMode.playersaturation+=3
$SurvivalMode.playersleep+=7
return 1
elsif item == :SWEETHEART #chocolate
$SurvivalMode.playerfood+=10#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playersleep+=6#208 is Sleep
return 1
elsif item == :SODAPOP
$SurvivalMode.playerwater-=11#206 is Thirst
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playersleep+=10#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :LEMONADE
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playerwater+=10#206 is Thirst
$SurvivalMode.playersleep+=7#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :HONEY
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
return 1
elsif item == :MOOMOOMILK
$SurvivalMode.playersaturation+=10
$SurvivalMode.playerwater+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :CSLOWPOKETAIL
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerfood+=10#205 is Hunger
return 1
elsif item == :BAKEDPOTATO
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=4#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
return 1
elsif item == :APPLE
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
return 1
elsif item == :CHOCOLATE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=7#205 is Hunger
return 1
elsif item == :LEMON
$SurvivalMode.playersaturation+=3#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=4#205 is Hunger
return 1
elsif item == :OLDGATEAU
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
return 1
elsif item == :LAVACOOKIE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=3#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
return 1
elsif item == :CASTELIACONE
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
return 1
elsif item == :LUMIOSEGALETTE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=6#205 is Hunger
return 1
elsif item == :SHALOURSABLE
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
return 1
elsif item == :BIGMALASADA
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
return 1
elsif item == :ONION
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
return 1
elsif item == :COOKEDORAN
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=6#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
return 1
elsif item == :CARROT
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
return 1
elsif item == :BREAD
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=11#205 is Hunger
return 1
elsif item == :TEA
$SurvivalMode.playersaturation+=15#207 is Saturation
$SurvivalMode.playerwater+=8#206 is Thirst
$SurvivalMode.playerfood+=2#205 is Hunger
return 1
elsif item == :CARROTCAKE
$SurvivalMode.playersaturation+=15#207 is Saturation
$SurvivalMode.playerwater+=15#206 is Thirst
$SurvivalMode.playerfood+=10#205 is Hunger
return 1
elsif item == :COOKEDMEAT
$SurvivalMode.playersaturation+=40#207 is Saturation
$SurvivalMode.playerwater+=0#206 is Thirst
$SurvivalMode.playerfood+=20#205 is Hunger
return 1
elsif item == :SITRUSJUICE
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=25#206 is Thirst
$SurvivalMode.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :BERRYMASH
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=5#206 is Thirst
$SurvivalMode.playerfood+=5#205 is Hunger
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
$SurvivalMode.playerhealth += 20
return 1
elsif item == :SUPERPOTION
$SurvivalMode.playerhealth += 40
return 1
elsif item == :HYPERPOTION
$SurvivalMode.playerhealth += 60
return 1
elsif item == :FULLRESTORE
$SurvivalMode.playerhealth += 100
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
$SurvivalMode.playerfood+=4
$SurvivalMode.playersaturation+=3
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += 1
elsif berry == :LEPPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :CHERIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :CHESTOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :PECHABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :RAWSTBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :ASPEARBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :PERSIMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :LUMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :FIGYBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :WIKIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :MAGOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :AGUAVBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :SITRUSBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=7
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += (0.25*$SurvivalMode.playerhealth)
elsif berry == :BERRYJUICE
$SurvivalMode.playerfood+=6
$SurvivalMode.playersaturation+=4
$SurvivalMode.playerwater+=4
$SurvivalMode.playerhealth += 2
elsif berry == :FRESHWATER
$SurvivalMode.playerwater+=10
$SurvivalMode.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SPEEDCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SPDEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :ACCCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=12
$SurvivalMode.playerwater-=7
elsif berry == :DEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :CRITCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :GSCURRY
$SurvivalMode.playerfood+=8#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$SurvivalMode.playerfood+=10
$SurvivalMode.playersaturation+=3
$SurvivalMode.playersleep+=7
elsif berry == :SWEETHEART #chocolate
$SurvivalMode.playerfood+=10#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playersleep+=6#208 is Sleep
elsif berry == :SODAPOP
$SurvivalMode.playerwater-=11#206 is Thirst
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playersleep+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playerwater+=10#206 is Thirst
$SurvivalMode.playersleep+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$SurvivalMode.playersaturation+=10
$SurvivalMode.playerwater+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerfood+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=4#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :APPLE
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :CHOCOLATE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :LEMON
$SurvivalMode.playersaturation+=3#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=4#205 is Hunger
elsif berry == :OLDGATEAU
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=3#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :CASTELIACONE
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
elsif berry == :BIGMALASADA
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
elsif berry == :ONION
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :COOKEDORAN
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=6#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :CARROT
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :BREAD
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=11#205 is Hunger
elsif berry == :TEA
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerwater+=8#206 is Thirst
$SurvivalMode.playerfood+=2#205 is Hunger
elsif berry == :CARROTCAKE
$SurvivalMode.playersaturation+=15#207 is Saturation
$SurvivalMode.playerwater+=15#206 is Thirst
$SurvivalMode.playerfood+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$SurvivalMode.playersaturation+=40#207 is Saturation
$SurvivalMode.playerwater+=0#206 is Thirst
$SurvivalMode.playerfood+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=25#206 is Thirst
$SurvivalMode.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=5#206 is Thirst
$SurvivalMode.playerfood+=5#205 is Hunger


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
 Kernel.pbMessage(_INTL("Sleep: {1}, Food: {2}, Water: {3}. ",$SurvivalMode.playersleep,$SurvivalMode.playerfood,$SurvivalMode.playerwater))
 if pbConfirmMessage(message)
   $PokemonBag.pbDeleteItem(berry,1)
   if berry == :ORANBERRY
$SurvivalMode.playerfood+=4
$SurvivalMode.playersaturation+=3
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += 1
elsif berry == :LEPPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :CHERIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :CHESTOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :PECHABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :RAWSTBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :ASPEARBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :PERSIMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :LUMBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :FIGYBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :WIKIBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :MAGOBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :AGUAVBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :IAPAPABERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=2
$SurvivalMode.playerwater+=2
elsif berry == :SITRUSBERRY
$SurvivalMode.playerfood+=5
$SurvivalMode.playersaturation+=7
$SurvivalMode.playerwater+=1
$SurvivalMode.playerhealth += (0.25*$SurvivalMode.playerhealth)
elsif berry == :BERRYJUICE
$SurvivalMode.playerfood+=6
$SurvivalMode.playersaturation+=4
$SurvivalMode.playerwater+=4
$SurvivalMode.playerhealth += 2
elsif berry == :FRESHWATER
$SurvivalMode.playerwater+=25
$SurvivalMode.playersaturation+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :WATER
$SurvivalMode.playerwater+=10
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SATKCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SPEEDCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :SPDEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :ACCCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=12
$SurvivalMode.playerwater-=7
elsif berry == :DEFCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :CRITCURRY
$SurvivalMode.playerfood+=8
$SurvivalMode.playersaturation+=15
$SurvivalMode.playerwater-=7
elsif berry == :GSCURRY
$SurvivalMode.playerfood+=8#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$SurvivalMode.playerfood+=10
$SurvivalMode.playersaturation+=3
$SurvivalMode.playersleep+=7
elsif berry == :SWEETHEART #chocolate
$SurvivalMode.playerfood+=10#205 is Hunger
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playersleep+=6#208 is Sleep
elsif berry == :SODAPOP
$SurvivalMode.playerwater-=11#206 is Thirst
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playersleep+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$SurvivalMode.playersaturation+=11#207 is Saturation
$SurvivalMode.playerwater+=15#206 is Thirst
$SurvivalMode.playersleep+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$SurvivalMode.playersaturation+=20
$SurvivalMode.playerwater+=7
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerfood+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=4#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :APPLE
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :CHOCOLATE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :LEMON
$SurvivalMode.playersaturation+=3#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=4#205 is Hunger
elsif berry == :OLDGATEAU
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=2#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater-=3#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :CASTELIACONE
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
elsif berry == :BIGMALASADA
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerfood+=8#205 is Hunger
elsif berry == :ONION
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :COOKEDORAN
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=6#206 is Thirst
$SurvivalMode.playerfood+=6#205 is Hunger
elsif berry == :CARROT
$SurvivalMode.playersaturation+=6#207 is Saturation
$SurvivalMode.playerwater+=3#206 is Thirst
$SurvivalMode.playerfood+=3#205 is Hunger
elsif berry == :BREAD
$SurvivalMode.playersaturation+=10#207 is Saturation
$SurvivalMode.playerwater+=7#206 is Thirst
$SurvivalMode.playerfood+=11#205 is Hunger
elsif berry == :TEA
$SurvivalMode.playersaturation+=8#207 is Saturation
$SurvivalMode.playerwater+=8#206 is Thirst
$SurvivalMode.playerfood+=2#205 is Hunger
elsif berry == :CARROTCAKE
$SurvivalMode.playersaturation+=15#207 is Saturation
$SurvivalMode.playerwater+=15#206 is Thirst
$SurvivalMode.playerfood+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$SurvivalMode.playersaturation+=40#207 is Saturation
$SurvivalMode.playerwater+=0#206 is Thirst
$SurvivalMode.playerfood+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$SurvivalMode.playersaturation+=20#207 is Saturation
$SurvivalMode.playerwater+=25#206 is Thirst
$SurvivalMode.playerfood+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$SurvivalMode.playersaturation+=5#207 is Saturation
$SurvivalMode.playerwater+=5#206 is Thirst
$SurvivalMode.playerfood+=5#205 is Hunger


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