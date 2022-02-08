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

FODVARI=205
H20VARI=206
HPVARI=225
STAVARI=4977
SATVARI=207
SLPVARI=208


Events.onStepTakenTransferPossible+=proc {

$game_switches[70]=true
pbchangeFood
pbchangeWater
pbchangeHealth
pbchangeSaturation
pbchangeSleep
pbchangeStamina

if $game_switches[75]==true
   $game_variables[30]=3
   $PokemonSystem.survivalmode = 0
   $PokemonSystem.nuzlockemode = 0
end

  if !GameData::MapMetadata.get($game_map.map_id).outdoor_map
   $game_screen.weather(:None, 0, 0)
  end

if $game_variables[HPVARI] < 1 && $PokemonSystem.survivalmode == 0
  pbStartOver
 end 
}

Events.onMapChanging  += proc {

#------------------------------------------------------------------------------#
#--------------------------Temperature                 ------------------------#
#------------------------------------------------------------------------------#


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


def pbSleepRestore
 if $game_variables[SLPVARI]<200
  $game_variables[SLPVARI]=$game_variables[SLPVARI]+($game_variables[247]*6)
 end
 if $game_variables[SATVARI]<1
   $game_variables[FODVARI]=$game_variables[FODVARI]-($game_variables[247]*3)
   $game_variables[H20VARI]=$game_variables[H20VARI]-($game_variables[247]*3)
   
  else
   $game_variables[SATVARI]=$game_variables[SATVARI]-($game_variables[247]*3)
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
$game_variables[FODVARI]+=4
$game_variables[SATVARI]+=3
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += 1
return 1
elsif item == :LEPPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :CHERIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :CHESTOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :PECHABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :RAWSTBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :ASPEARBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :PERSIMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :LUMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :FIGYBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :WIKIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :MAGOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :AGUAVBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
return 1
elsif item == :SITRUSBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=7
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += (0.25*$game_variables[HPVARI])
return 1
elsif item == :BERRYJUICE
$game_variables[FODVARI]+=6
$game_variables[SATVARI]+=4
$game_variables[H20VARI]+=4
$game_variables[HPVARI] += 2
return 1
elsif item == :FRESHWATER
$game_variables[H20VARI]+=20
$game_variables[SATVARI]+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
#You can add more if you want
elsif item == :ATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :SATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :SPEEDCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :SPDEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :ACCCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=12
$game_variables[H20VARI]-=7
return 1
elsif item == :DEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :CRITCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
return 1
elsif item == :GSCURRY
$game_variables[FODVARI]+=8#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=7#206 is Thirst
return 1
elsif item == :RAGECANDYBAR #chocolate
$game_variables[FODVARI]+=10
$game_variables[SATVARI]+=3
$game_variables[SLPVARI]+=7
return 1
elsif item == :SWEETHEART #chocolate
$game_variables[FODVARI]+=10#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[SLPVARI]+=6#208 is Sleep
return 1
elsif item == :SODAPOP
$game_variables[H20VARI]-=11#206 is Thirst
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[SLPVARI]+=10#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :LEMONADE
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[H20VARI]+=10#206 is Thirst
$game_variables[SLPVARI]+=7#208 is Sleep
return 1
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :HONEY
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
return 1
elsif item == :MOOMOOMILK
$game_variables[SATVARI]+=10
$game_variables[H20VARI]+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :CSLOWPOKETAIL
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[FODVARI]+=10#205 is Hunger
return 1
elsif item == :BAKEDPOTATO
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=4#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
return 1
elsif item == :APPLE
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
return 1
elsif item == :CHOCOLATE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=7#205 is Hunger
return 1
elsif item == :LEMON
$game_variables[SATVARI]+=3#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=4#205 is Hunger
return 1
elsif item == :OLDGATEAU
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
return 1
elsif item == :LAVACOOKIE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=3#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
return 1
elsif item == :CASTELIACONE
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
return 1
elsif item == :LUMIOSEGALETTE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=6#205 is Hunger
return 1
elsif item == :SHALOURSABLE
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
return 1
elsif item == :BIGMALASADA
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
return 1
elsif item == :ONION
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
return 1
elsif item == :COOKEDORAN
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=6#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
return 1
elsif item == :CARROT
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
return 1
elsif item == :BREAD
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=11#205 is Hunger
return 1
elsif item == :TEA
$game_variables[SATVARI]+=15#207 is Saturation
$game_variables[H20VARI]+=8#206 is Thirst
$game_variables[FODVARI]+=2#205 is Hunger
return 1
elsif item == :CARROTCAKE
$game_variables[SATVARI]+=15#207 is Saturation
$game_variables[H20VARI]+=15#206 is Thirst
$game_variables[FODVARI]+=10#205 is Hunger
return 1
elsif item == :COOKEDMEAT
$game_variables[SATVARI]+=40#207 is Saturation
$game_variables[H20VARI]+=0#206 is Thirst
$game_variables[FODVARI]+=20#205 is Hunger
return 1
elsif item == :SITRUSJUICE
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=25#206 is Thirst
$game_variables[FODVARI]+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
return 1
elsif item == :BERRYMASH
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=5#206 is Thirst
$game_variables[FODVARI]+=5#205 is Hunger
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
$game_variables[HPVARI] += 20
return 1
elsif item == :SUPERPOTION
$game_variables[HPVARI] += 40
return 1
elsif item == :HYPERPOTION
$game_variables[HPVARI] += 60
return 1
elsif item == :FULLRESTORE
$game_variables[HPVARI] += 100
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

class Pokemon

  def changeFood(wari)
  end
  
  def changeWater(wari)
  end
  
  def changeAge(wari)
  end
end


  def pbchangeFood
    if $game_variables[FODVARI] < 0
	   $game_variables[FODVARI]=0
	end
    if $game_variables[256]==(:SSHIRT)
      if $game_variables[FODVARI]>150
        $game_variables[FODVARI]=150  #food
	  end
    elsif $game_variables[FODVARI]>100
        $game_variables[FODVARI]=100
  end
    $game_variables[FODVARI] -= 1 if rand(50) && $game_variables[SATVARI]==0 && $game_variables[256]== 0
    $game_variables[FODVARI] += 1 if rand(50) && $game_variables[256]==(:LCLOAK) && !$game_variables[SATVARI]==0
    $game_variables[FODVARI] += 0 if rand(50) && $game_variables[256]==(:LCLOAK) && $game_variables[SATVARI]==0
    $game_variables[H20VARI] += 2 if rand(50) == 1 && $game_variables[256]==(:LJACKET)
  end

  def pbchangeWater
    if $game_variables[H20VARI] < 0
	   $game_variables[H20VARI]=0
	end
    if $game_variables[256]==(:SSHIRT) 
       if $game_variables[H20VARI]>150
        $game_variables[H20VARI]=150  #thirst
	   end
    elsif $game_variables[H20VARI]>100
        $game_variables[H20VARI]=100  #sleep
	end
    $game_variables[H20VARI] -= 1 if rand(50) && $game_variables[SATVARI]==0 && $game_variables[256]== 0
    $game_variables[H20VARI] += 1 if rand(50) && $game_variables[256]==(:LCLOAK) && !$game_variables[SATVARI]==0
    $game_variables[H20VARI] += 0 if rand(50) && $game_variables[256]==(:LCLOAK) && $game_variables[SATVARI]==0
    $game_variables[H20VARI] += 2 if rand(50) == 1 && $game_variables[256]==(:SEASHOES) && $PokemonGlobal.surfing
	
	
    end

  def pbchangeSleep
    if $game_variables[SLPVARI] < 0
	   $game_variables[SLPVARI]=0
	end
    if $game_variables[256]==(:SSHIRT)
        if $game_variables[SLPVARI]>150
           $game_variables[SLPVARI]=150 
		end
    elsif $game_variables[SLPVARI]>200
        $game_variables[SLPVARI]=200  #sleep
	end
  end

  def pbchangeSaturation
    if $game_variables[SATVARI] < 1
	   $game_variables[SATVARI]=0
	end
    if $game_variables[256]==(:SSHIRT)
         if $game_variables[SATVARI]>50
            $game_variables[SATVARI]=50 
		 end
	end
    $game_variables[SATVARI] -= 1 if rand(50) && $game_variables[256]== 0
    $game_variables[SATVARI] -= 4 if rand(50) == 1 && $game_variables[256]==(:LCLOAK)#take from saturation
	end

  def pbchangeStamina
    if $game_variables[STAVARI] < 0
	   $game_variables[STAVARI]=0
	end
	end

  def pbchangeHealth
    if $game_variables[HPVARI] < 0
	   $game_variables[HPVARI]=0
	end
	if $game_variables[256]==(:IRONARMOR)
	    if $game_variables[HPVARI]>150
         $game_variables[HPVARI]=150
		end
		
    else 
	  if $game_variables[HPVARI]>100
        $game_variables[HPVARI]=100 
	   end
	end
  end


def pbLifeCheck
if $PokemonSystem.survivalmode = 0 && $game_variables[204]==2 && EliteBattle.get(:nuzlocke) && (data.include?(:NOREVIVE) || data.include?(:PEMADEATH)) && val <= 0
   Kernel.pbMessage(_INTL("Ah. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("I see. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("You are in it for the challenge. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("By doing this, you not only put yourself at risk. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("but you risk your own POKeMON too. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("I bring you another choice. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("You may also enable POKeMON needing to eat and drink (Sleep is unneeded). ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("Pokemon will age, and they may die from that. ",GameData::Item.get(berry).name))
   Kernel.pbMessage(_INTL("Their Life expectancy is entirely based on their hardships. ",GameData::Item.get(berry).name))
   message=_INTL("Do you wish to activate Pokemon Survival Mode?",GameData::Item.get(berry).name)
    if pbConfirmMessage(message)
	      Kernel.pbMessage(_INTL("You cannot come to terms with this from the Menu. ",GameData::Item.get(berry).name))
		  Kernel.pbMessage(_INTL("Your choice is made. ",GameData::Item.get(berry).name))
		  $game_switches[75]=true
	else
		  Kernel.pbMessage(_INTL("Understandable. ",GameData::Item.get(berry).name))
	end
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
$game_variables[FODVARI]+=4
$game_variables[SATVARI]+=3
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += 1
elsif berry == :LEPPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :CHERIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :CHESTOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :PECHABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :RAWSTBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :ASPEARBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :PERSIMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :LUMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :FIGYBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :WIKIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :MAGOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :AGUAVBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :SITRUSBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=7
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += (0.25*$game_variables[HPVARI])
elsif berry == :BERRYJUICE
$game_variables[FODVARI]+=6
$game_variables[SATVARI]+=4
$game_variables[H20VARI]+=4
$game_variables[HPVARI] += 2
elsif berry == :FRESHWATER
$game_variables[H20VARI]+=10
$game_variables[SATVARI]+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SPEEDCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SPDEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :ACCCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=12
$game_variables[H20VARI]-=7
elsif berry == :DEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :CRITCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :GSCURRY
$game_variables[FODVARI]+=8#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$game_variables[FODVARI]+=10
$game_variables[SATVARI]+=3
$game_variables[SLPVARI]+=7
elsif berry == :SWEETHEART #chocolate
$game_variables[FODVARI]+=10#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[SLPVARI]+=6#208 is Sleep
elsif berry == :SODAPOP
$game_variables[H20VARI]-=11#206 is Thirst
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[SLPVARI]+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[H20VARI]+=10#206 is Thirst
$game_variables[SLPVARI]+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$game_variables[SATVARI]+=10
$game_variables[H20VARI]+=15
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[FODVARI]+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=4#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :APPLE
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :CHOCOLATE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :LEMON
$game_variables[SATVARI]+=3#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=4#205 is Hunger
elsif berry == :OLDGATEAU
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=3#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :CASTELIACONE
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
elsif berry == :BIGMALASADA
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
elsif berry == :ONION
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :COOKEDORAN
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=6#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :CARROT
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :BREAD
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=11#205 is Hunger
elsif berry == :TEA
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[H20VARI]+=8#206 is Thirst
$game_variables[FODVARI]+=2#205 is Hunger
elsif berry == :CARROTCAKE
$game_variables[SATVARI]+=15#207 is Saturation
$game_variables[H20VARI]+=15#206 is Thirst
$game_variables[FODVARI]+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$game_variables[SATVARI]+=40#207 is Saturation
$game_variables[H20VARI]+=0#206 is Thirst
$game_variables[FODVARI]+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=25#206 is Thirst
$game_variables[FODVARI]+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=5#206 is Thirst
$game_variables[FODVARI]+=5#205 is Hunger


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
 Kernel.pbMessage(_INTL("Sleep: {1}, Food: {2}, Water: {3}. ",$game_variables[SLPVARI],$game_variables[FODVARI],$game_variables[H20VARI]))
 if pbConfirmMessage(message)
   $PokemonBag.pbDeleteItem(berry,1)
   if berry == :ORANBERRY
$game_variables[FODVARI]+=4
$game_variables[SATVARI]+=3
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += 1
elsif berry == :LEPPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :CHERIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :CHESTOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :PECHABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :RAWSTBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :ASPEARBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :PERSIMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :LUMBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :FIGYBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :WIKIBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :MAGOBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :AGUAVBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :IAPAPABERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=2
$game_variables[H20VARI]+=2
elsif berry == :SITRUSBERRY
$game_variables[FODVARI]+=5
$game_variables[SATVARI]+=7
$game_variables[H20VARI]+=1
$game_variables[HPVARI] += (0.25*$game_variables[HPVARI])
elsif berry == :BERRYJUICE
$game_variables[FODVARI]+=6
$game_variables[SATVARI]+=4
$game_variables[H20VARI]+=4
$game_variables[HPVARI] += 2
elsif berry == :FRESHWATER
$game_variables[H20VARI]+=25
$game_variables[SATVARI]+=10#207 is Saturation
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :WATER
$game_variables[H20VARI]+=10
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
#You can add more if you want
elsif berry == :ATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SATKCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SPEEDCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :SPDEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :ACCCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=12
$game_variables[H20VARI]-=7
elsif berry == :DEFCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :CRITCURRY
$game_variables[FODVARI]+=8
$game_variables[SATVARI]+=15
$game_variables[H20VARI]-=7
elsif berry == :GSCURRY
$game_variables[FODVARI]+=8#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=7#206 is Thirst
elsif berry == :RAGECANDYBAR #chocolate
$game_variables[FODVARI]+=10
$game_variables[SATVARI]+=3
$game_variables[SLPVARI]+=7
elsif berry == :SWEETHEART #chocolate
$game_variables[FODVARI]+=10#205 is Hunger
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[SLPVARI]+=6#208 is Sleep
elsif berry == :SODAPOP
$game_variables[H20VARI]-=11#206 is Thirst
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[SLPVARI]+=10#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :LEMONADE
$game_variables[SATVARI]+=11#207 is Saturation
$game_variables[H20VARI]+=15#206 is Thirst
$game_variables[SLPVARI]+=7#208 is Sleep
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :HONEY
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :MOOMOOMILK
$game_variables[SATVARI]+=20
$game_variables[H20VARI]+=7
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :CSLOWPOKETAIL
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[FODVARI]+=10#205 is Hunger
elsif berry == :BAKEDPOTATO
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=4#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :APPLE
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :CHOCOLATE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :LEMON
$game_variables[SATVARI]+=3#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=4#205 is Hunger
elsif berry == :OLDGATEAU
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=2#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :LAVACOOKIE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]-=3#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :CASTELIACONE
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=7#205 is Hunger
elsif berry == :LUMIOSEGALETTE
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :SHALOURSABLE
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
elsif berry == :BIGMALASADA
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[FODVARI]+=8#205 is Hunger
elsif berry == :ONION
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :COOKEDORAN
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=6#206 is Thirst
$game_variables[FODVARI]+=6#205 is Hunger
elsif berry == :CARROT
$game_variables[SATVARI]+=6#207 is Saturation
$game_variables[H20VARI]+=3#206 is Thirst
$game_variables[FODVARI]+=3#205 is Hunger
elsif berry == :BREAD
$game_variables[SATVARI]+=10#207 is Saturation
$game_variables[H20VARI]+=7#206 is Thirst
$game_variables[FODVARI]+=11#205 is Hunger
elsif berry == :TEA
$game_variables[SATVARI]+=8#207 is Saturation
$game_variables[H20VARI]+=8#206 is Thirst
$game_variables[FODVARI]+=2#205 is Hunger
elsif berry == :CARROTCAKE
$game_variables[SATVARI]+=15#207 is Saturation
$game_variables[H20VARI]+=15#206 is Thirst
$game_variables[FODVARI]+=10#205 is Hunger
elsif berry == :COOKEDMEAT
$game_variables[SATVARI]+=40#207 is Saturation
$game_variables[H20VARI]+=0#206 is Thirst
$game_variables[FODVARI]+=20#205 is Hunger
elsif berry == :SITRUSJUICE
$game_variables[SATVARI]+=20#207 is Saturation
$game_variables[H20VARI]+=25#206 is Thirst
$game_variables[FODVARI]+=0#205 is Hunger
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
elsif berry == :BERRYMASH
$game_variables[SATVARI]+=5#207 is Saturation
$game_variables[H20VARI]+=5#206 is Thirst
$game_variables[FODVARI]+=5#205 is Hunger


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

