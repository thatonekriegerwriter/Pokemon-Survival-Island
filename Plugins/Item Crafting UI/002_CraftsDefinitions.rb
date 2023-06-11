def pbCraftingBench(wari)

if wari == :UPGRADEDCRAFTINGBENCH || wari == :CRAFTINGBENCH 
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Station Crafting"),
                            _INTL("Basic Crafting"),
                            _INTL("Upgraded Crafting"),
                            _INTL("Farming Crafting"),
                            _INTL("Berry Crafting"),
                            _INTL("Combat Items"),
                            _INTL("Cancel")],-1)
		  if cmd==0 #Station
		  if $game_switches[409]!=true 
		  if wari == :UPGRADEDCRAFTINGBENCH
		  pbItemCrafter([
         [:CRAFTINGBENCH,[:WOODENPLANKS,5]],
         [:APRICORNCRAFTING,[:WOODENPLANKS,6,:STONE,2]],
         [:FURNACE,[:STONE,6]],
         [:CAULDRON,[:IRON2,6]],
         [:GRINDER,[:STONE,5,:IRON2,3]],
         [:MEDICINEPOT,[:CLAY2,6,:CHARCOAL,3]],
         [:BEDROLL,[:WOODENPLANKS,3,:WOOL,3]],
         [:ITEMCRATE,[:WOODENPLANKS,5,:LIGHTCLAY,2]],
         [:PORTABLEPC,[:WOODENPLANKS,5,:IRON2,3,:POKEBALLC,5]],
         [:PORTABLECAMP,[:WOOL,5,:WOODENPLANKS,5,:COPPER2,2]],
         [:UPGRADEDCRAFTINGBENCH,[:WOODENPLANKS,5,:SILVER2,4]],
         [:MACHINEBOX,[:THUNDERSTONE,1,:IRON2,5]]
         ])
		 if $bag.has?(:MACHINEBOX)
		  $game_switches[409]=true
		 end
		   else
		  pbItemCrafter([
         [:CRAFTINGBENCH,[:WOODENPLANKS,5]],
         [:APRICORNCRAFTING,[:WOODENPLANKS,6,:STONE,2]],
         [:FURNACE,[:STONE,6]],
         [:CAULDRON,[:IRON2,6]],
         [:BEDROLL,[:WOODENPLANKS,3,:WOOL,3]],
         [:ITEMCRATE,[:WOODENPLANKS,5,:LIGHTCLAY,2]],
         [:PORTABLEPC,[:WOODENPLANKS,5,:IRON2,3,:POKEBALLC,5]],
         [:PORTABLECAMP,[:WOOL,5,:WOODENPLANKS,5,:COPPER2,2]],
         [:UPGRADEDCRAFTINGBENCH,[:WOODENPLANKS,5,:SILVER2,4]]
         ])
		   end
		 elsif $game_switches[409]==true
		 if $game_switches[169]==true
		  puts "169"
		  pbItemCrafter([
         [:CRAFTINGBENCH,[:WOODENPLANKS,5]],
         [:APRICORNCRAFTING,[:WOODENPLANKS,6,:STONE,2]],
         [:FURNACE,[:STONE,6]],
         [:CAULDRON,[:IRON2,6]],
         [:GRINDER,[:STONE,5,:IRON2,3]],
         [:MEDICINEPOT,[:CLAY2,6,:CHARCOAL,3]],
         [:BEDROLL,[:WOODENPLANKS,3,:WOOL,3]],
         [:ITEMCRATE,[:WOODENPLANKS,5,:LIGHTCLAY,2]],
         [:PORTABLEPC,[:WOODENPLANKS,5,:IRON2,3,:POKEBALLC,5]],
         [:PORTABLECAMP,[:WOOL,5,:WOODENPLANKS,5,:COPPER2,2]],
         [:UPGRADEDCRAFTINGBENCH,[:WOODENPLANKS,5,:SILVER2,4]],
         [:MACHINEBOX,[:THUNDERSTONE,1,:IRON2,5]],
         [:SPRINKLER,[:STONE,5,:MACHINEBOX,1]],
         [:ELECTRICGRINDER,[:CLAY2,6,:CHARCOAL,3,:GRINDER,1,:MACHINEBOX,1]],
         [:ELECTRICFURNACE,[:COPPER2,8,:IRON2,30,:FURNACE,1,:STONE,10,:MACHINEBOX,1]],
         [:ELECTRICPRESS,[:COPPER2,2,:IRON2,20,:STONE,5,:MACHINEBOX,1]],
         [:APRICORNMACHINE,[:COPPER2,8,:SILVER2,2,:APRICORNCRAFTING,2,:STONE,20,:MACHINEBOX,1]],
         [:SEWINGMACHINE,[:COPPER2,4,:IRON2,5,:CRAFTINGBENCH,2,:STONE,5,:MACHINEBOX,1]],
         [:CUTTER,[:COPPER2,4,:IRON2,7,:WOODENLOG,5,:STONE,5,:MACHINEBOX,1]],
         [:COALGENERATOR,[:COPPER2,8,:IRON2,30,:FURNACE,4,:STONE,10,:MACHINEBOX,1]],
         [:SOLARGENERATOR,[:COPPER2,8,:IRON2,30,:GLASS,20,:STONE,10,:MACHINEBOX,1]],
         [:WINDGENERATOR,[:COPPER2,8,:IRON2,60,:MACHINEBOX,1]],
         [:HYDROGENERATOR,[:COPPER2,8,:IRON2,30,:CAULDRON,4,:STONE,10,:MACHINEBOX,1]],
         [:POKEGENERATOR,[:COPPER2,8,:IRON2,30,:PORTABLEPC,2,:STONE,10,:MACHINEBOX,1]]
         ])
		 else
		  puts "No 169"
		  pbItemCrafter([
         [:CRAFTINGBENCH,[:WOODENPLANKS,5]],
         [:APRICORNCRAFTING,[:WOODENPLANKS,6,:STONE,2]],
         [:FURNACE,[:STONE,6]],
         [:CAULDRON,[:IRON2,6]],
         [:GRINDER,[:STONE,5,:IRON2,3]],
         [:MEDICINEPOT,[:CLAY2,6,:CHARCOAL,3]],
         [:BEDROLL,[:WOODENPLANKS,3,:WOOL,3]],
         [:ITEMCRATE,[:WOODENPLANKS,5,:LIGHTCLAY,2]],
         [:PORTABLEPC,[:WOODENPLANKS,5,:IRON2,3,:POKEBALLC,5]],
         [:PORTABLECAMP,[:WOOL,5,:WOODENPLANKS,5,:COPPER2,2]],
         [:UPGRADEDCRAFTINGBENCH,[:WOODENPLANKS,5,:SILVER2,4]],
         [:MACHINEBOX,[:THUNDERSTONE,1,:IRON2,5]],
         [:SPRINKLER,[:STONE,5,:MACHINEBOX,1]],
         [:ELECTRICGRINDER,[:CLAY2,6,:CHARCOAL,3,:GRINDER,1,:MACHINEBOX,1]],
         [:ELECTRICFURNACE,[:COPPER2,8,:IRON2,30,:FURNACE,1,:STONE,10,:MACHINEBOX,1]],
         [:ELECTRICPRESS,[:COPPER2,2,:IRON2,20,:STONE,5,:MACHINEBOX,1]],
         [:APRICORNMACHINE,[:COPPER2,8,:SILVER2,2,:APRICORNCRAFTING,2,:STONE,20,:MACHINEBOX,1]],
         [:SEWINGMACHINE,[:COPPER2,4,:IRON2,5,:CRAFTINGBENCH,2,:STONE,5,:MACHINEBOX,1]],
         [:CUTTER,[:COPPER2,4,:IRON2,7,:WOODENLOG,5,:STONE,5,:MACHINEBOX,1]],
         [:COALGENERATOR,[:COPPER2,8,:IRON2,30,:FURNACE,4,:STONE,10,:MACHINEBOX,1]]
         ])
		 end
		  end
		  elsif cmd==1 #Basic
		  if wari == :UPGRADEDCRAFTINGBENCH
		  pbItemCrafter([
         [:WOODENPLANKS,[:WOODENLOG,0.5]],
         [:OLDROD,[:WOODENPLANKS,2]],
         [:BOWL,[:WOODENPLANKS,3]],
         [:GLASSBOTTLE,[:GLASS,1]],
         [:STONEAXE,[:WOODENPLANKS,3,:STONE,3]],
         [:STONEHAMMER,[:WOODENPLANKS,3,:STONE,5]],
         [:STONEPICKAXE,[:WOODENPLANKS,3,:STONE,5]]
         ])
		 else
		  pbItemCrafter([
         [:WOODENPLANKS,[:WOODENLOG,0.5]],
         [:OLDROD,[:WOODENPLANKS,2]],
         [:BOWL,[:WOODENPLANKS,3]],
         [:GLASSBOTTLE,[:GLASS,1]],
         [:STONEAXE,[:WOODENPLANKS,3,:STONE,3]],
         [:STONEHAMMER,[:WOODENPLANKS,3,:STONE,5]],
         [:STONEPICKAXE,[:WOODENPLANKS,3,:STONE,5]]
         ])
		 end
		  elsif cmd==2 #Upgraded
		  if wari == :UPGRADEDCRAFTINGBENCH
		  pbItemCrafter([
        [:WATERBOTTLE,[:IRON2,3,:WOODENPLANKS,1]],
        [:GOODROD,[:OLDROD,1,:IRON2,2]],
        [:MACHETE,[:IRON2,2,:WOODENPLANKS,1]],
        [:PICKAXE,[:WOODENPLANKS,2,:IRON2,3]],
        [:SHOVEL,[:WOODENPLANKS,3,:IRON2,3]],
        [:IRONHAMMER,[:WOODENPLANKS,3,:IRON2,5]],
        [:IRONPICKAXE,[:WOODENPLANKS,3,:IRON2,5]],
		[:MAKESHIFTRUNNINGSHOES,[:NORMALSHOES,1,:SWIFTFEATHER,2]],
        [:RAFT,[:WOODENPLANKS,50,:IRON2,3,:IRONHAMMER,1,:WOOL,5,:SILVER2,2]],
        [:CLOCK,[:GOLD2,4,:SILVER2,1]],
        [:EXPALL,[:EXPSHARE,5,:IRON2,10]]
        ])
		else
		  pbItemCrafter([
        [:WATERBOTTLE,[:IRON2,3,:WOODENPLANKS,1]],
        [:GOODROD,[:OLDROD,1,:IRON2,2]],
        [:MACHETE,[:IRON2,2,:WOODENPLANKS,1]],
        [:PICKAXE,[:WOODENPLANKS,2,:IRON2,3]],
        [:SHOVEL,[:WOODENPLANKS,3,:IRON2,3]],
        [:IRONHAMMER,[:WOODENPLANKS,3,:IRON2,5]],
        [:IRONPICKAXE,[:WOODENPLANKS,3,:IRON2,5]],
		[:MAKESHIFTRUNNINGSHOES,[:NORMALSHOES,1,:SWIFTFEATHER,2]]
        ])
		end
		  elsif cmd==3 #Farming
		  if wari == :UPGRADEDCRAFTINGBENCH
		  pbItemCrafter([
[:CROPSTICKS,[:WOODENPLANKS,4]],
[:GROWTHMULCH,[:BALMMUSHROOM,3,:MOOMOOMILK,1]],
[:DAMPMULCH,[:REDAPRICORN,2,:FRESHWATER,3]],
[:STABLEMULCH,[:MIRACLESEED,2,:FRESHWATER,1]],
[:GOOEYMULCH,[:MOOMOOMILK,1,:BLUEAPRICORN,1]],
[:PRODUCEMULCH,[:LEFTOVERS,0.5,:MOOMOOMILK,1]],
[:POTENTIALMULCH,[:BALMMUSHROOM,1,:FRESHWATER,2]]
])
          else
		  pbItemCrafter([
[:CROPSTICKS,[:WOODENPLANKS,4]],
[:GROWTHMULCH,[:BALMMUSHROOM,3,:MOOMOOMILK,1]],
[:DAMPMULCH,[:REDAPRICORN,2,:FRESHWATER,3]],
[:STABLEMULCH,[:MIRACLESEED,2,:FRESHWATER,1]],
[:GOOEYMULCH,[:MOOMOOMILK,1,:BLUEAPRICORN,1]],
[:PRODUCEMULCH,[:LEFTOVERS,0.5,:MOOMOOMILK,1]],
[:POTENTIALMULCH,[:BALMMUSHROOM,1,:FRESHWATER,2]],
[:GROWTHMULCH2,[:GROWTHMULCH,1,:FERTILIZERMIX,1]],
[:DAMPMULCH2,[:DAMPMULCH,1,:FERTILIZERMIX,1]],
[:STABLEMULCH2,[:STABLEMULCH,1,:FERTILIZERMIX,1]],
[:GOOEYMULCH2,[:GOOEYMULCH,1,:FERTILIZERMIX,1]],
[:PRODUCEMULCH2,[:PRODUCEMULCH,1,:FERTILIZERMIX,1]],
[:POTENTIALMULCH2,[:POTENTIALMULCH,1,:FERTILIZERMIX,1]],
[:FERTILIZERMIX,[:BONEDUST,1,:FRESHWATER,1]]
])
		  end
         elsif cmd==4 #Berry
		 if wari == :UPGRADEDCRAFTINGBENCH
		 pbItemCrafter([
[:HEALPOWDER,[:CHERIBERRY,0.50]],
[:ENERGYPOWDER,[:SITRUSBERRY,0.50]],
[:BERRYJUICE,[:ORANBERRY,1]],
[:RARECANDY,[:CORNNBERRY,30,:MAGOSTBERRY,30]],
[:HPUP,[:CORNNBERRY,10]],
[:PPUP,[:MAGOSTBERRY,10]],
[:IRON,[:GANLONBERRY,10]],
[:CALCIUM,[:PETAYABERRY,10]],
[:ZINC,[:APICOTBERRY,10]],
[:CARBOS,[:SALACBERRY,1]]
])
else
		 pbItemCrafter([
[:HEALPOWDER,[:CHERIBERRY,0.50]],
[:ENERGYPOWDER,[:SITRUSBERRY,0.50]],
[:BERRYJUICE,[:ORANBERRY,2,:BOWL,1]]
])
end
         elsif cmd==5 #Combat Items
		 if wari == :UPGRADEDCRAFTINGBENCH
pbItemCrafter([
[:REPEL,[:IRON2,1,:LEAFSTONE,0.5]],
[:SUPERREPEL,[:REPEL,1,:MOONSTONE,0.5]],
[:MAXREPEL,[:SUPERREPEL,1,:THUNDERSTONE,0.5]],
[:SNATCHER,[:IRON2,20,:SILVER2,5,:COPPER2,2]],
[:MEGARING,[:MEGASTONE,1,:SILVER2,3]]
])
else
pbItemCrafter([
[:REPEL,[:IRON2,1,:LEAFSTONE,0.5]],
[:SUPERREPEL,[:REPEL,1,:MOONSTONE,0.5]],
[:MAXREPEL,[:SUPERREPEL,1,:THUNDERSTONE,0.5]],
[:DARTCASING,[:IRON2,1,:SILVER2,2]],
[:POISONDART,[:DARTCASING,1,:LEAFSTONE,0.5]],
[:SLEEPDART,[:DARTCASING,1,:MOONSTONE,0.5]],
[:PARALYZDART,[:DARTCASING,1,:THUNDERSTONE,0.5]],
[:ICEDART,[:DARTCASING,1,:ICESTONE,0.5]],
[:FIREDART,[:DARTCASING,1,:FIRESTONE,0.5]]
])
end
end
elsif wari == :APRICORNCRAFTING || wari == :APRICORNMACHINE
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Basic Balls"),
                            _INTL("Gen 2"),
                            _INTL("Gen 3"),
                            _INTL("Gen 4"),
                            _INTL("Type Based"),
                            _INTL("Status Based"),
                            _INTL("New Balls"),
                            _INTL("Other"),
                            _INTL("Cancel")],-1)
		if wari == :APRICORNCRAFTING
		  if cmd==0
pbItemCrafter([
[:POKEBALLC,[:REDAPRICORN,1,:TUMBLEROCK,1]],
[:GREATBALLC,[:REDAPRICORN,2,:BLUEAPRICORN,1,:TUMBLEROCK,1]],
[:ULTRABALLC,[:BLACKAPRICORN,2,:YELLOWAPRICORN,1,:REDAPRICORN,1,:TUMBLEROCK,1]],
[:SUPERBALLC,[:WHITEAPRICORN,4,:GREENAPRICORN,1,:YELLOWAPRICORN,2,:TUMBLEROCK,1]],
[:PREMIERBALLC,[:WHITEAPRICORN,1,:POKEBALLC,1]],
[:MASTERBALLC,[:PURPLEAPRICORN,2,:ENIGMABERRY,2,:COMETSHARD,1,:TUMBLEROCK,1]]
])
		 elsif cmd==1
		 pbItemCrafter([
[:LUREBALLC,[:REDAPRICORN,1,:BLUEAPRICORN,2,:TUMBLEROCK,1]],
[:LEVELBALLC,[:BLACKAPRICORN,2,:REDAPRICORN,1,:TUMBLEROCK,1]],
[:HEAVYBALLC,[:BLUEAPRICORN,2,:TUMBLEROCK,1]],
[:LOVEBALLC,[:WHITEAPRICORN,2,:TUMBLEROCK,1]],
[:SPORTBALLC,[:REDAPRICORN,2,:WHITEAPRICORN,1,:TUMBLEROCK,1]],
[:SAFARIBALLC,[:GREENAPRICORN,2,:YELLOWAPRICORN,1,:TUMBLEROCK,1]],
[:FRIENDBALLC,[:GREENAPRICORN,2,:WHITEAPRICORN,1,:TUMBLEROCK,1]]
])
		 elsif cmd==2
		 pbItemCrafter([
[:NESTBALLC,[:GREENAPRICORN,2,:YELLOWAPRICORN,1,:TANGABERRY,1,:TUMBLEROCK,1]],
[:REPEATBALLC,[:REDAPRICORN,1,:BLACKAPRICORN,2,:JABOCABERRY,3,:TUMBLEROCK,1]],
[:LUXURYBALLC,[:REDAPRICORN,1,:WHITEAPRICORN,2,:TUMBLEROCK,1]],
[:DIVEBALLC,[:PINKAPRICORN,1,:BLUEAPRICORN,2,:PASSHOBERRY,2,:TUMBLEROCK,1]],
[:TIMERBALLC,[:WHITEAPRICORN,2,:BLACKAPRICORN,1,:DURINBERRY,2,:TUMBLEROCK,1]]
])
		 elsif cmd==3
		 pbItemCrafter([
[:DUSKBALLC,[:BLACKAPRICORN,2,:BLUEAPRICORN,1,:BLUKBERRY,2,:TUMBLEROCK,1]],
[:HEALBALLC,[:PINKAPRICORN,1,:WHITEAPRICORN,2,:ORANBERRY,5,:TUMBLEROCK,1]],
[:QUICKBALLC,[:YELLOWAPRICORN,1,:BLUEAPRICORN,2,:CUSTAPBERRY,2,:TUMBLEROCK,1]],
[:CHERISHBALLC,[:REDAPRICORN,1,:POKEBALLC,2,:TUMBLEROCK,1]]
])
		 elsif cmd==4
		 pbItemCrafter([
[:NETBALLC,[:BLACKAPRICORN,1,:WHITEAPRICORN,2,:TUMBLEROCK,1]],
[:SHOCKBALLC,[:YELLOWAPRICORN,3,:WHITEAPRICORN,2,:TUMBLEROCK,1]],
[:MOONBALLC,[:YELLOWAPRICORN,2,:BLACKAPRICORN,1,:TUMBLEROCK,1]]
])
		 elsif cmd==5
		 pbItemCrafter([
[:STATUSBALLC,[:WHITEAPRICORN,2,:REDAPRICORN,5,:PECHABERRY,4,:TUMBLEROCK,1]],
[:BURNBALLC,[:REDAPRICORN,3,:GREENAPRICORN,1,:RAWSTBERRY,4,:TUMBLEROCK,1]],
[:DREAMBALLC,[:BLACKAPRICORN,1,:PINKAPRICORN,3,:CHESTOBERRY,4,:TUMBLEROCK,1]],
[:FREEZEBALLC,[:BLUEAPRICORN,3,:WHITEAPRICORN,3,:ASPEARBERRY,4,:TUMBLEROCK,1]],
[:STUNBALLC,[:YELLOWAPRICORN,2,:PINKAPRICORN,3,:CHERIBERRY,4,:TUMBLEROCK,1]],
[:TOXICBALLC,[:BLACKAPRICORN,3,:GREENAPRICORN,2,:PECHABERRY,4,:TUMBLEROCK,1]]
])
		 elsif cmd==6
		 pbItemCrafter([
[:BARBEDBALLC,[:GREENAPRICORN,2,:BLACKAPRICORN,2,:IRON2,1,:TUMBLEROCK,1]],
[:YOLOBALLC,[:REDAPRICORN,4,:PINKAPRICORN,1,:SHUCABERRY,1,:TUMBLEROCK,1]],
[:STATUSBALLC,[:BLACKAPRICORN,2,:PINKAPRICORN,3,:STARFBERRY,1,:TUMBLEROCK,1]],
[:HIDDENBALLC,[:PINKAPRICORN,8,:GREENAPRICORN,8,:CUSTAPBERRY,5,:TUMBLEROCK,1]],
[:IMMUNEBALLC,[:BLACKAPRICORN,1,:WHITEAPRICORN,3,:CHILANBERRY,2,:TUMBLEROCK,1]],
[:DEBUFFBALLC,[:REDAPRICORN,1,:BLACKAPRICORN,3,:YELLOWAPRICORN,3,:TUMBLEROCK,1]],
[:DAWNBALLC,[:WHITEAPRICORN,1,:YELLOWAPRICORN,1,:TUMBLEROCK,1]]
])
elsif wari == :APRICORNMACHINE
          $game_switches[554]=true
		  if cmd==0
		  pbItemCrafter([
[:POKEBALLC,[:REDAPRICORN,1,:TUMBLEROCK,1]],
[:GREATBALLC,[:REDAPRICORN,2,:BLUEAPRICORN,1,:TUMBLEROCK,1]],
[:ULTRABALLC,[:BLACKAPRICORN,2,:YELLOWAPRICORN,1,:REDAPRICORN,1,:TUMBLEROCK,1]],
[:SUPERBALLC,[:WHITEAPRICORN,4,:GREENAPRICORN,1,:YELLOWAPRICORN,2,:TUMBLEROCK,1]],
[:PREMIERBALLC,[:WHITEAPRICORN,1,:POKEBALLC,1,:TUMBLEROCK,1]],
[:MASTERBALLC,[:PURPLEAPRICORN,2,:ENIGMABERRY,2,:COMETSHARD,1,:TUMBLEROCK,1]]
])
		 elsif cmd==1
		 pbItemCrafter([
[:LUREBALLC,[:REDAPRICORN,0.5,:BLUEAPRICORN,1,:TUMBLEROCK,1]],
[:LEVELBALLC,[:BLACKAPRICORN,1,:REDAPRICORN,0.5,:TUMBLEROCK,1]],
[:HEAVYBALLC,[:BLUEAPRICORN,1,:TUMBLEROCK,1]],
[:LOVEBALLC,[:WHITEAPRICORN,1,:TUMBLEROCK,1]],
[:SPORTBALLC,[:REDAPRICORN,1,:WHITEAPRICORN,0.5,:TUMBLEROCK,1]],
[:SAFARIBALLC,[:GREENAPRICORN,1,:YELLOWAPRICORN,0.5,:TUMBLEROCK,1]],
[:FRIENDBALLC,[:GREENAPRICORN,1,:WHITEAPRICORN,0.5,:TUMBLEROCK,1]]
])
		 elsif cmd==2
		 pbItemCrafter([
[:NESTBALLC,[:GREENAPRICORN,1,:YELLOWAPRICORN,0.5,:TANGABERRY,0.5,:TUMBLEROCK,1]],
[:REPEATBALLC,[:REDAPRICORN,0.5,:BLACKAPRICORN,1,:JABOCABERRY,1.5,:TUMBLEROCK,1]],
[:LUXURYBALLC,[:REDAPRICORN,0.5,:WHITEAPRICORN,1,:TUMBLEROCK,1]],
[:DIVEBALLC,[:PINKAPRICORN,0.5,:BLUEAPRICORN,1,:PASSHOBERRY,1,:TUMBLEROCK,1]],
[:TIMERBALLC,[:WHITEAPRICORN,1,:BLACKAPRICORN,0.5,:DURINBERRY,1,:TUMBLEROCK,1]]
])
		 elsif cmd==3
		 pbItemCrafter([
[:DUSKBALLC,[:BLACKAPRICORN,1,:BLUEAPRICORN,0.5,:BLUKBERRY,1,:TUMBLEROCK,1]],
[:HEALBALLC,[:PINKAPRICORN,0.5,:WHITEAPRICORN,1,:ORANBERRY,2.5,:TUMBLEROCK,1]],
[:QUICKBALLC,[:YELLOWAPRICORN,0.5,:BLUEAPRICORN,1,:CUSTAPBERRY,1,:TUMBLEROCK,1]],
[:CHERISHBALLC,[:REDAPRICORN,0.5,:POKEBALLC,1,:TUMBLEROCK,1]]
])
		 elsif cmd==4
		 pbItemCrafter([
[:NETBALLC,[:BLACKAPRICORN,0.5,:WHITEAPRICORN,1,:TUMBLEROCK,1]],
[:SHOCKBALLC,[:YELLOWAPRICORN,1.5,:WHITEAPRICORN,1,:TUMBLEROCK,1]],
[:MOONBALLC,[:YELLOWAPRICORN,1,:BLACKAPRICORN,0.5,:TUMBLEROCK,1]]
])
		 elsif cmd==5
		 pbItemCrafter([
[:STATUSBALLC,[:WHITEAPRICORN,1,:REDAPRICORN,2.5,:PECHABERRY,2,:TUMBLEROCK,1]],
[:BURNBALLC,[:REDAPRICORN,1.5,:GREENAPRICORN,0.5,:RAWSTBERRY,2,:TUMBLEROCK,1]],
[:DREAMBALLC,[:BLACKAPRICORN,0.5,:PINKAPRICORN,1.5,:CHESTOBERRY,2,:TUMBLEROCK,1]],
[:FREEZEBALLC,[:BLUEAPRICORN,1.5,:WHITEAPRICORN,1.5,:ASPEARBERRY,2,:TUMBLEROCK,1]],
[:STUNBALLC,[:YELLOWAPRICORN,1,:PINKAPRICORN,1.5,:CHERIBERRY,2,:TUMBLEROCK,1]],
[:TOXICBALLC,[:BLACKAPRICORN,1.5,:GREENAPRICORN,1,:PECHABERRY,2,:TUMBLEROCK,1]]
])
		 elsif cmd==6
		 pbItemCrafter([
[:BARBEDBALLC,[:GREENAPRICORN,1,:BLACKAPRICORN,1,:IRON2,0.5,:TUMBLEROCK,1]],
[:YOLOBALLC,[:REDAPRICORN,2,:PINKAPRICORN,0.5,:SHUCABERRY,0.5,:TUMBLEROCK,1]],
[:STATUSBALLC,[:BLACKAPRICORN,1,:PINKAPRICORN,1.5,:STARFBERRY,0.5,:TUMBLEROCK,1]],
[:HIDDENBALLC,[:PINKAPRICORN,4,:GREENAPRICORN,4,:CUSTAPBERRY,2.5,:TUMBLEROCK,1]],
[:IMMUNEBALLC,[:BLACKAPRICORN,0.5,:WHITEAPRICORN,1.5,:CHILANBERRY,1,:TUMBLEROCK,1]],
[:DEBUFFBALLC,[:REDAPRICORN,0.5,:BLACKAPRICORN,1.5,:YELLOWAPRICORN,1.5,:TUMBLEROCK,1]],
[:DAWNBALLC,[:WHITEAPRICORN,0.5,:YELLOWAPRICORN,0.5,:TUMBLEROCK,1]]
])
end
end
end
elsif wari == :MEDICINEPOT
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Medicine"),
                            _INTL("Cancel")],-1)
		  if cmd==0
		  pbItemCrafter([
[:REVIVE,[:ARGOSTBERRY,5,:QUALOTBERRY,3,:IRON2,2]],
[:MAXREVIVE,[:REVIVE,1,:ARGOSTBERRY,3,:REVIVALHERB,2,:IRON2,2]],
[:POTION,[:ORANBERRY,2,:WATERBOTTLE,1]],
[:SUPERPOTION,[:POTION,1,:SITRUSBERRY,2,:QUALOTBERRY,1]],
[:HYPERPOTION,[:SUPERPOTION,1,:SITRUSBERRY,3,:QUALOTBERRY,3]],
[:FULLRESTORE,[:HYPERPOTION,1,:SITRUSBERRY,3,:QUALOTBERRY,5,:HONDEWBERRY,3]]
])
end
elsif wari == :POCKETCRAFTING
pbItemCrafter([
[:WOODENPLANKS,[:WOODENLOG,0.5]],
[:CRAFTINGBENCH,[:WOODENPLANKS,5]],
[:HEALPOWDER,[:CHERIBERRY,0.25]],
[:ENERGYPOWDER,[:SITRUSBERRY,0.25]],
[:BERRYJUICE,[:ORANBERRY,2,:BOWL,1]],
[:GLASSBOTTLE,[:GLASS,1]],
[:STONE,[:HARDSTONE,1]]
])
elsif  wari == :GRINDER ||  wari == :ELECTRICGRINDER
  if wari == :GRINDER
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Ore"),
                            _INTL("Item"),
                            _INTL("Cancel")],-1)
		  if cmd==0
		  pbItemCrafter([
[:IRONDUST,[:IRONORE,0.50]],
[:GOLDDUST,[:GOLDORE,0.50]],
[:COPPERDUST,[:COPPERORE,0.50]],
[:SILVERDUST,[:SILVERORE,0.50]],
])
		  elsif cmd==1
		  pbItemCrafter([
[:IRONDUST,[:IRONBALL,0.40]],
[:IRONDUST,[:IRONPLATE,0.25]],
[:STARDUST,[:STARPIECE,1]],
[:STARDUST,[:STARPIECE,1]],
[:GOLDDUST,[:NUGGET,0.50]],
[:GOLDDUST,[:BIGNUGGET,0.25]],
[:GOLDDUST,[:RELICGOLD,0.25]],
[:CLAYDUST,[:LIGHTCLAY,0.50]],
[:COPPERDUST,[:RELICCOPPER,0.50]],
[:SILVERDUST,[:RELICSILVER,0.50]],
[:BONEDUST,[:THICKCLUB,0.50]],
[:BONEDUST,[:RAREBONE,0.25]],
[:STONE,[:HARDSTONE,0.33]],
[:STONE,[:EVERSTONE,0.75]],
[:SUGAR,[:SUGARCANE,0.50]]
])
end
elsif wari == :ELECTRICGRINDER
          $game_switches[554]=true
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Ore"),
                            _INTL("Item"),
                            _INTL("Plate"),
                            _INTL("Cancel")],-1)
		  if cmd==0
		  pbItemCrafter([
[:IRONDUST,[:IRONORE,0.25]],
[:GOLDDUST,[:GOLDORE,0.25]],
[:COPPERDUST,[:COPPERORE,0.25]],
[:SILVERDUST,[:SILVERORE,0.25]],
])
		  elsif cmd==1
		  pbItemCrafter([
[:IRONDUST,[:IRONBALL,0.30]],
[:IRONDUST,[:IRONPLATE,0.20]],
[:STARDUST,[:STARPIECE,0.50]],
[:GOLDDUST,[:NUGGET,0.40]],
[:GOLDDUST,[:BIGNUGGET,0.20]],
[:GOLDDUST,[:RELICGOLD,0.20]],
[:CLAYDUST,[:LIGHTCLAY,0.25]],
[:COPPERDUST,[:RELICCOPPER,0.40]],
[:SILVERDUST,[:RELICSILVER,0.40]],
[:BONEDUST,[:THICKCLUB,0.30]],
[:BONEDUST,[:RAREBONE,0.20]],
[:STONE,[:HARDSTONE,0.25]],
[:STONE,[:EVERSTONE,0.50]],
[:SUGAR,[:SUGARCANE,0.25]]
])
		  elsif cmd==2
		  pbItemCrafter([
[:IRONDUST,[:IRONBALL,0.30]],
[:IRONDUST,[:IRONPLATE,0.20]],
[:STARDUST,[:STARPIECE,0.50]],
[:GOLDDUST,[:NUGGET,0.40]],
[:GOLDDUST,[:BIGNUGGET,0.20]],
[:GOLDDUST,[:RELICGOLD,0.20]],
[:CLAYDUST,[:LIGHTCLAY,0.25]],
[:COPPERDUST,[:RELICCOPPER,0.40]],
[:SILVERDUST,[:RELICSILVER,0.40]],
[:IRONDUST,[:IRONBALL,0.30]],
[:IRONDUST,[:IRONPLATE,0.20]],
[:STARDUST,[:STARPIECE,0.50]],
[:GOLDDUST,[:NUGGET,0.40]],
[:GOLDDUST,[:BIGNUGGET,0.20]],
[:GOLDDUST,[:RELICGOLD,0.20]],
[:CLAYDUST,[:LIGHTCLAY,0.25]],
[:COPPERDUST,[:RELICCOPPER,0.40]],
[:SILVERDUST,[:RELICSILVER,0.40]]
])
end
end
elsif wari == :FURNACE || wari == :ELECTRICFURNACE
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Coal"),
                            _INTL("Ore"),
                            _INTL("Food"),
                            _INTL("Glass"),
                            _INTL("Cancel")],-1)
		if wari == :ELECTRICFURNACE
          $game_switches[554]=true
		  if cmd==0
		  pbItemCrafter([
[:CHARCOAL,[:WOODENPLANKS,1]]
])
		  elsif cmd==1
		  pbItemCrafter([
[:IRON2,[:IRONORE,1]],
[:IRON2,[:IRONDUST,0.5]],
[:GOLD2,[:GOLDORE,1]],
[:GOLD2,[:GOLDDUST,0.5]],
[:COPPER2,[:COPPERORE,1]],
[:COPPER2,[:COPPERDUST,0.5]],
[:SILVER2,[:SILVERORE,1]],
[:SILVER2,[:SILVERDUST,0.5]],
[:CLAY2,[:LIGHTCLAY,1]],
[:CLAY2,[:CLAYDUST,0.5]]
])
		  elsif cmd==2
		  pbItemCrafter([
[:COOKEDORAN,[:ORANBERRY,1]],
[:BAKEDPOTATO,[:POTATO,1]],
[:CSLOWPOKETAIL,[:SLOWPOKETAIL,1]],
[:COOKEDMEAT,[:MEAT,1]]
])
		  elsif cmd==3
		  pbItemCrafter([
[:GLASS,[:SOFTSAND,2]],
[:BLACKFLUTE,[:GLASS,2]]
])
        end
        elsif wari == :FURNACE
	 coal=0
	 value=0
pbFadeOutIn(99999){
scene = PokemonBag_Scene.new
screen = PokemonBagScreen.new(scene,$PokemonBag)
coal = screen.pbChooseItemScreen(proc { |item| GameData::Item.get(item).is_coal? })
}
	 if coal
	 if coal == :CHARCOAL
  	   value=0.90
	 elsif coal == :COAL
  	   value=0.75
	 elsif coal == :ACORN
  	   value=4
	 elsif coal == :WOODENLOG
  	   value=1
	 elsif coal == :WOODENPLANKS
  	   value=2
	 elsif coal == :HEATROCK
  	   value=0.25
	 elsif coal == :FIRESTONE
  	   value=0.5
	 end
 end
		  if cmd==0
		  pbItemCrafter([
[:CHARCOAL,[:WOODENPLANKS,1,coal,value]]
])
		  elsif cmd==1
		  pbItemCrafter([
[:IRON2,[:IRONORE,1,coal,value]],
[:IRON2,[:IRONDUST,0.5,coal,value]],
[:GOLD2,[:GOLDORE,1,coal,value]],
[:GOLD2,[:GOLDDUST,0.5,coal,value]],
[:COPPER2,[:COPPERORE,1,coal,value]],
[:COPPER2,[:COPPERDUST,0.5,coal,value]],
[:SILVER2,[:SILVERORE,1,coal,value]],
[:SILVER2,[:SILVERDUST,0.5,coal,value]],
[:CLAY2,[:LIGHTCLAY,1,coal,value]],
[:CLAY2,[:CLAYDUST,0.5,coal,value]]
])
		  elsif cmd==2
		  pbItemCrafter([
[:COOKEDORAN,[:ORANBERRY,1,coal,value]],
[:BAKEDPOTATO,[:POTATO,1,coal,value]],
[:CSLOWPOKETAIL,[:SLOWPOKETAIL,1,coal,value]],
[:COOKEDMEAT,[:MEAT,1,coal,value]],
[:FRESHWATER,[:WATER,1,coal,value]]
])
		  elsif cmd==3
		  pbItemCrafter([
[:GLASS,[:SOFTSAND,4,coal,value]],
[:BLACKFLUTE,[:GLASS,4,coal,value]],
])
	 
	 
	 end
end
elsif wari == :ELECTRICPRESS
          $game_switches[554]=true
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Pressing"),
                            _INTL("Cancel")],-1)
		  if cmd==0
		    pbItemCrafter([
[:FLAMEPLATE,[:REDSHARD,4]],
[:SPLASHPLATE,[:BLUESHARD,4]],
[:ZAPPLATE,[:YELLOWSHARD,4]],
[:MEADOWPLATE,[:GREENSHARD,4]],
[:ICICLEPLATE,[:BLUESHARD,2,:YELLOWSHARD,2]],
[:FISTPLATE,[:REDSHARD,3,:GREENSHARD,1]],
[:TOXICPLATE,[:GREENSHARD,2,:REDSHARD,2]],
[:EARTHPLATE,[:GREENSHARD,2,:BLUESHARD,2]],
[:SKYPLATE,[:GREENSHARD,2,:YELLOWSHARD,2]],
[:MINDPLATE,[:YELLOWSHARD,2,:BLUESHARD,2]],
[:INSECTPLATE,[:GREENSHARD,2,:YELLOWSHARD,2]],
[:SPOOKYPLATE,[:REDSHARD,2,:YELLOWSHARD,2]],
[:DRACOPLATE,[:REDSHARD,3,:BLUESHARD,1]],
[:DREADPLATE,[:BLUESHARD,3,:GREENSHARD,1]],
[:IRONPLATE,[:GREENSHARD,3,:BLUESHARD,1]],
[:HARDSTONE,[:STONE,2]]
])
end
elsif wari == :SEWINGMACHINE
          $game_switches[554]=true
	      cmd = pbMessage(_INTL("What do you intend to Craft?"),[
                            _INTL("Pokemon"),
                            _INTL("Player"),
                            _INTL("Dolls"),
                            _INTL("Cancel")],-1)
		  if cmd==0
		  pbItemCrafter([
[:CHOICESCARF,[:WOOL,4]],
[:EXPERTBELT,[:LEATHER,3]],
[:MUSCLEBAND,[:WOOL,3,:LIECHIBERRY,3]],
[:BINDINGBAND,[:WOOL,2,:IRON2,3]],
[:FOCUSBAND,[:WOOL,5,:ARGOSTBERRY,4]],
[:FOCUSSASH,[:WOOL,2,:ARGOSTBERRY,1]],
[:BLACKBELT,[:LEATHER,2,:CHOPLEBERRY,2]],
[:SILKSCARF,[:SILK,2,:WOOL,2]],
[:REDSCARF,[:REDSHARD,3,:WOOL,2]],
[:BLUESCARF,[:BLUESHARD,2,:WOOL,2]],
[:PINKSCARF,[:REDSHARD,2,:WOOL,2]],
[:GREENSCARF,[:GREENSHARD,3,:WOOL,2]],
[:YELLOWSCARF,[:YELLOWSHARD,3,:WOOL,2]],
[:LUCKYPUNCH,[:LEATHER,6,:LANSATBERRY,4]],
[:MACHOBRACE,[:WOOL,5,:IRON2,6,:SILVER2,3]],
[:POWERBELT,[:WOOL,2,:LEATHER,3]],
[:POWERBAND,[:WOOL,3,:LEATHER,4]],
[:POWERANKLET,[:WOOL,1,:LEATHER,2]]
])
		  elsif cmd==1
		  pbItemCrafter([
[:LCLOAK,[:WOOL,12]],
[:SSHIRT,[:SILK,8,:WOOL,3]],
[:LJACKET,[:LEATHER,6,:WOOL,3]],
[:IRONARMOR,[:IRONPLATE,10,:WOOL,10]],
[:SEASHOES,[:LEATHER,4,:WOOL,2,:SILK,2]],
[:PROTECTIVEVEST,[:IRON2,2,:LEATHER,4]],
[:GHOSTMAIL,[:SILVER2,2,:SPOOKYPLATE,10]]
])
		  elsif cmd==2
		  pbItemCrafter([
[:SMOOCHUMDOLL,[:WOOL,2]],
[:TORCHICDOLL,[:WOOL,2]],
[:MEOWTHDOLL,[:WOOL,2]],
[:TREECKODOLL,[:WOOL,2]],
[:TREECKODOLL,[:WOOL,2]]
])
end
elsif wari== :CUTTER
end
$game_switches[554]=false
end

def pbCutterWorking
amt = $bag.quantity(:WOODENLOG)
if $bag.has?(:WOODENLOG)
    params = ChooseNumberParams.new
    params.setMaxDigits(99)
    params.setRange(0,amt)
    msgwindow = pbCreateMessageWindow(nil,nil)
    pbMessageDisplay(msgwindow,_INTL("How many Logs are you cutting down?\nYou have {1} {2}s.",$bag.quantity(:WOODENLOG),GameData::Item.get(:WOODENLOG).name))
	amt2 = pbChooseNumber(msgwindow,params)
    pbDisposeMessageWindow(msgwindow)
	amt2*=3.5
	amt2 = amt2.round
	if amt2 > 0 && $bag.can_add?(:WOODENPLANKS,amt2)
	 $bag.add(:WOODENPLANKS,amt2)
	 $bag.remove(:WOODENLOG,amt2)
      pbMessage(_INTL("You got {1} {2}s.",amt2,GameData::Item.get(:WOODENPLANKS).name))
	 return true
	elsif amt==0
	 return false
	else
    pbMessage(_INTL("You don't have enough room in your bag."))
	 return false
    end
else
    pbMessage(_INTL("You don't have any Logs.")) 
end
end