def pbeggtech(var,war)
  pkmn = var
  hpiv = pkmn.iv[:HP] & 15
  ativ = pkmn.iv[:ATTACK] & 15
  dfiv = pkmn.iv[:DEFENSE] & 15
  saiv = pkmn.iv[:SPECIAL_ATTACK] & 15
  sdiv = pkmn.iv[:SPECIAL_DEFENSE] & 15
  spiv = pkmn.iv[:SPEED] & 15
  hpev = pkmn.ev[:HP] & 15
  atev = pkmn.ev[:ATTACK] & 15
  dfev = pkmn.ev[:DEFENSE] & 15
  saev = pkmn.ev[:SPECIAL_ATTACK] & 15
  sdev = pkmn.ev[:SPECIAL_DEFENSE] & 15
  spev = pkmn.ev[:SPEED] & 15
  case $game_variables[249]
   when "0"
      Kernel.pbMessage(_INTL("What do you give the Egg? ",GameData::Item.get(berry).name))
      
berry=0
pbFadeOutIn(99999){
scene = PokemonBag_Scene.new
screen = PokemonBagScreen.new(scene,$PokemonBag)
berry = screen.pbChooseItemScreen(Proc.new { |item| GameData::Item.get(item).is_foodwater? || GameData::Item.get(item).is_berry?})
}
if berry
$PokemonBag.pbDeleteItem(berry,1)
Kernel.pbMessage(_INTL("You give it {1}. ",GameData::Item.get(berry).name))
#205 is Hunger, 207 is Saturation, 206 is Thirst, 208 is Sleep
if berry == :ORANBERRY
pkmn.happiness += 2
 return true
elsif berry == :LEPPABERRY
pkmn.happiness += 4
 return true
elsif berry == :CHERIBERRY
pkmn.happiness += 4
 return true
elsif berry == :CHESTOBERRY
pkmn.happiness += 2
 return true
elsif berry == :PECHABERRY
pkmn.happiness += 4
 return true
elsif berry == :RAWSTBERRY
pkmn.happiness += 2
 return true
elsif berry == :ASPEARBERRY
pkmn.loyalty += 2
 return true
elsif berry == :PERSIMBERRY
pkmn.loyalty += 5
 return true
elsif berry == :LUMBERRY
hpiv += 0.10
 return true
elsif berry == :FIGYBERRY
pkmn.loyalty += 2
pkmn.happiness += 2
 return true
elsif berry == :WIKIBERRY
pkmn.loyalty += 4
pkmn.happiness += 7
 return true
elsif berry == :MAGOBERRY
pkmn.loyalty += 6
pkmn.happiness += 2
 return true
elsif berry == :AGUAVBERRY
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :IAPAPABERRY
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :SITRUSBERRY
hpiv += (0.90*pkmn.iv[:HP])
 return true
elsif berry == :BERRYJUICE
pkmn.happiness += 4
 return true
elsif berry == :FRESHWATER
pkmn.happiness += 10
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
 return true
#You can add more if you want
elsif berry == :ATKCURRY
ativ += 0.25
atev += 1
 return true
elsif berry == :SATKCURRY
saiv += 0.25
saev += 1
 return true
elsif berry == :SPEEDCURRY
spiv += 0.25
spev += 1
 return true
elsif berry == :SPDEFCURRY
sdiv += 0.25
sdev += 1
 return true
elsif berry == :ACCCURRY
spiv += 0.1
spev += 0.1
pkmn.loyalty += 2
pkmn.happiness += 2
 return true
elsif berry == :DEFCURRY
dfiv += 0.25
dfev += 1
 return true
elsif berry == :CRITCURRY
ativ += 1
atev += 1
 return true
elsif berry == :GSCURRY
hpev += 2
 return true
elsif berry == :RAGECANDYBAR #chocolate
saev += 2
atev += 2
pkmn.steps_to_hatch -= 10
pkmn.nature = :GREEDY if rand(255)==0 
return true
elsif berry == :SWEETHEART #chocolate
hpev += 15
pkmn.steps_to_hatch -= 10
pkmn.nature = :GREEDY if rand(255)==0 
 return true
elsif berry == :SODAPOP
sdev += 5
pkmn.steps_to_hatch -= 7
pkmn.nature = :GREEDY if rand(255)==0 
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
 return true
elsif berry == :LEMONADE
sdev += 5
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
 return true
elsif berry == :HONEY
hpev += 15
pkmn.loyalty += 6
pkmn.happiness += 6
pkmn.steps_to_hatch -= 4
 return true
elsif berry == :MOOMOOMILK
pkmn.loyalty += 6
pkmn.happiness += 6
pkmn.steps_to_hatch -= 4
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
 return true
elsif berry == :CSLOWPOKETAIL
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :BAKEDPOTATO
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :APPLE
pkmn.loyalty += 1
pkmn.happiness += 1
 return true
elsif berry == :CHOCOLATE
pkmn.loyalty += 6
pkmn.happiness += 6
pkmn.steps_to_hatch -= 10
 return true
elsif berry == :LEMON
ativ += 5
pkmn.happiness = 0
 return true
elsif berry == :OLDGATEAU
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :LAVACOOKIE
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :CASTELIACONE
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :LUMIOSEGALETTE
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :SHALOURSABLE
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :BIGMALASADA
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :ONION
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :COOKEDORAN
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :CARROT
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :BREAD
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :TEA
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :CARROTCAKE
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :COOKEDMEAT
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
elsif berry == :SITRUSJUICE
pkmn.loyalty += 6
pkmn.happiness += 6
$PokemonBag.pbStoreItem(:WATERBOTTLE,1)
Kernel.pbMessage(_INTL("You put the bottle in your Bag."))
 return true
elsif berry == :BERRYMASH
pkmn.loyalty += 6
pkmn.happiness += 6
 return true
else
 return false
end
end
   when "1"
   if pkmn.steps_to_hatch < 75
    pkmn.steps_to_hatch -= 3
    pkmn.happiness += 6
    pkmn.loyalty += 6
   elsif pkmn.steps_to_hatch < 50
    pkmn.steps_to_hatch -= 1
    pkmn.happiness += 6
    pkmn.loyalty += 6
   elsif pkmn.steps_to_hatch < 25
    pkmn.steps_to_hatch -= 0
    pkmn.happiness += 6
    pkmn.loyalty += 6
   end
   
   when "2"
   if pkmn.steps_to_hatch < 75
    pkmn.steps_to_hatch -= 5
    pkmn.happiness += 2
    pkmn.loyalty -= 1
   elsif pkmn.steps_to_hatch < 50
    pkmn.steps_to_hatch -= 1
    pkmn.happiness += 2
    pkmn.loyalty -= 1
   elsif pkmn.steps_to_hatch < 25
    pkmn.steps_to_hatch -= 0
    pkmn.happiness += 2
    pkmn.loyalty -= 1
   end

   when "3"
    pkmn.steps_to_hatch -= 25
    pkmn.happiness -= 25
    pkmn.loyalty -= 50
    pkmn.nature = :HATEFUL if rand(255)<=25 

   when "4"
     $Trainer.party[$Trainer.party.length] = pkmn
     pkmn = 0
	 war=false
	 
end
end

def pbeggcheckhatch(vari)
 if vari==0
  return false
 elsif vari.steps_to_hatch==0 && !vari==0
   return true
 else
  return false
end
end