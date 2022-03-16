
if maps.include?($game_map.map_id) && GameData::EncounterType.get($PokemonTemp.encounterType).type == :land 
 if ($game_variables[4974]=="ADALYNN"||$game_variables[4974]=="Adalynn"||$game_variables[4974]=="adalynn"||$game_variables[4974]=="SNOW"||$game_variables[4974]=="Snow"||$game_variables[4974]=="snow"|| $game_variables[4974]=="POTS"||$game_variables[4974]=="Pots"||$game_variables[4974]=="pots")
  pkmn = e[0]
  if rand(18)==0
  pkmn.species = :VULPIX
  pkmn.level = 80
  pkmn.happiness = 255
  pkmn.learn_move(:FLAMETHROWER)
  pkmn.learn_move(:HEADBUTT)
  pkmn.learn_move(:FIREBLAST)
  pkmn.learn_move(:AURORABEAM)
  pkmn.item = :LUCKYEGG
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Pallet Town @ Day"
  pkmn.iv[:HP] = 22
  pkmn.iv[:ATTACK] = 31
  pkmn.iv[:DEFENSE] = 12
  pkmn.iv[:SPECIAL_ATTACK] = 18
  pkmn.iv[:SPECIAL_DEFENSE] = 18
  pkmn.iv[:SPEED] = 10
  pkmn.ev[:HP] = 33402
  pkmn.ev[:ATTACK] = 27664
  pkmn.ev[:SPECIAL_ATTACK] = 31091
  pkmn.ev[:SPECIAL_DEFENSE] = 31091
  pkmn.ev[:DEFENSE] = 22374
  pkmn.ev[:SPEED] = 22321
  pkmn.calc_stats
  elsif rand(18)==1
  pkmn.species = :POLITOED
  pkmn.level = 80
pkmn.happiness = 255
pkmn.learn_move(:SURF)
pkmn.learn_move(:LOVELYKISS)
pkmn.learn_move(:CROSSCHOP)
pkmn.learn_move(:WHIRLPOOL)
pkmn.item = :LUCKYEGG
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Route 22 @ Night"
pkmn.iv[:HP] = 14
pkmn.iv[:ATTACK] = 20
pkmn.iv[:DEFENSE] = 26
pkmn.iv[:SPECIAL_ATTACK] = 2
pkmn.iv[:SPECIAL_DEFENSE] = 2
pkmn.iv[:SPEED] = 13
pkmn.ev[:HP] = 21563
pkmn.ev[:ATTACK] = 24707
pkmn.ev[:DEFENSE] = 25807
pkmn.ev[:SPECIAL_ATTACK] = 20047
pkmn.ev[:SPECIAL_DEFENSE] = 20047
pkmn.ev[:SPEED] = 20487
  pkmn.calc_stats
  elsif rand(18)==2
  pkmn.species = :DRAGONITE
  pkmn.level = 80
pkmn.happiness = 255
pkmn.learn_move(:HYPERBEAM)
pkmn.learn_move(:THUNDERBOLT)
pkmn.learn_move(:EARTHQUAKE)
pkmn.learn_move(:OUTRAGE)
pkmn.item = :LUCKYEGG
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Goldenrod City @ Day"
pkmn.iv[:HP] = 20
pkmn.iv[:ATTACK] = 22
pkmn.iv[:SPECIAL_ATTACK] = 14
pkmn.iv[:SPECIAL_DEFENSE] = 14
pkmn.iv[:DEFENSE] = 20
pkmn.iv[:SPEED] = 22
pkmn.ev[:HP] = 28545
pkmn.ev[:ATTACK] = 37231
pkmn.ev[:SPECIAL_ATTACK] = 28702
pkmn.ev[:SPECIAL_DEFENSE] = 28702
pkmn.ev[:DEFENSE] = 29287
pkmn.ev[:SPEED] = 27677
  pkmn.calc_stats
  elsif rand(18)==3
  pkmn.species = :ESPEON
  pkmn.level = 80
pkmn.happiness = 255
pkmn.learn_move(:PSYBEAM)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:PSYCHIC)
pkmn.learn_move(:PSYCHUP)
pkmn.item = :LUCKYEGG
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Celadon City @ Day"
pkmn.iv[:HP] = 20
pkmn.iv[:ATTACK] = 2
pkmn.iv[:SPECIAL_ATTACK] = 4
pkmn.iv[:SPECIAL_DEFENSE] = 4
pkmn.iv[:DEFENSE] = 8
pkmn.iv[:SPEED] = 31
pkmn.ev[:HP] = 19627
pkmn.ev[:ATTACK] = 28571
pkmn.ev[:SPECIAL_ATTACK] = 26751
pkmn.ev[:SPECIAL_DEFENSE] = 26751
pkmn.ev[:DEFENSE] = 23243
pkmn.ev[:SPEED] = 20398
  pkmn.calc_stats
  elsif rand(18)==4
  pkmn.species = :CROBAT
  pkmn.level = 80
pkmn.happiness = 255
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Mt Moon @ Night"
pkmn.learn_move(:WINDATTACK)
pkmn.learn_move(:FLY)
pkmn.learn_move(:GIGADRAIN)
pkmn.learn_move(:SHADOWBALL)
pkmn.item = :LUCKYEGG
pkmn.iv[:HP] = 24
pkmn.iv[:ATTACK] = 14
pkmn.iv[:SPECIAL_ATTACK] = 20
pkmn.iv[:SPECIAL_DEFENSE] = 20
pkmn.iv[:DEFENSE] = 14
pkmn.iv[:SPEED] = 12
pkmn.ev[:HP] = 23227
pkmn.ev[:ATTACK] = 23897
pkmn.ev[:SPECIAL_ATTACK] = 23038
pkmn.ev[:SPECIAL_DEFENSE] = 23038
pkmn.ev[:DEFENSE] = 25972
pkmn.ev[:SPEED] = 35069
  pkmn.calc_stats
  elsif rand(18)==5
  pkmn.species = :DONPHAN
  pkmn.level = 80
pkmn.happiness = 255
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Route 34 @ Night"
pkmn.learn_move(:EARTHQUAKE)
pkmn.learn_move(:ANCIENTPOWER)
pkmn.learn_move(:RAPIDSPIN)
pkmn.learn_move(:STRENGTH)
pkmn.item = :LUCKYEGG
pkmn.iv[:HP] = 20
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 4
pkmn.iv[:SPECIAL_DEFENSE] = 4
pkmn.iv[:DEFENSE] = 20
pkmn.iv[:SPEED] = 31
pkmn.ev[:HP] = 20034
pkmn.ev[:ATTACK] = 35791
pkmn.ev[:SPECIAL_ATTACK] = 20713
pkmn.ev[:SPECIAL_DEFENSE] = 20713
pkmn.ev[:DEFENSE] = 20670
pkmn.ev[:SPEED] = 20464
  pkmn.calc_stats
  elsif rand(18)==6
  pkmn.species = :BELLOSSOM
  pkmn.name = "Adalyne"
  pkmn.level = 47
pkmn.happiness = 255
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Goldenrod City"
pkmn.learn_move(:HIDDENPOWER)
pkmn.learn_move(:STUNSPORE)
pkmn.learn_move(:SLEEPPOWDER)
pkmn.learn_move(:ACID)
pkmn.item = :EXPSHARE
pkmn.shiny = true
pkmn.iv[:HP] = 8
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 20
pkmn.iv[:SPECIAL_DEFENSE] = 20
pkmn.iv[:DEFENSE] = 20
pkmn.iv[:SPEED] = 20
pkmn.ev[:HP] = 2605
pkmn.ev[:ATTACK] = 2792
pkmn.ev[:SPECIAL_ATTACK] = 2801
pkmn.ev[:SPECIAL_DEFENSE] = 2801
pkmn.ev[:DEFENSE] = 2876
pkmn.ev[:SPEED] = 2488
  pkmn.calc_stats
  elsif rand(18)==7
  pkmn.species = :MEGANIUM
  pkmn.name = "Peepo"
  pkmn.level = 65
pkmn.happiness = 255
pkmn.learn_move(:CUT)
pkmn.learn_move(:ANCIENTPOWER)
pkmn.learn_move(:SOLARBEAM)
pkmn.learn_move(:RAZORLEAF)
pkmn.item = :LUCKYEGG
pkmn.owner.id = 57002
pkmn.owner.name = "SNOW"
pkmn.obtain_text = "Pallet Town"
pkmn.iv[:HP] = 6
pkmn.iv[:ATTACK] = 28
pkmn.iv[:SPECIAL_ATTACK] = 14
pkmn.iv[:SPECIAL_DEFENSE] = 14
pkmn.iv[:DEFENSE] = 12
pkmn.iv[:SPEED] = 2
pkmn.ev[:HP] = 20558
pkmn.ev[:ATTACK] = 23285
pkmn.ev[:SPECIAL_ATTACK] = 26772
pkmn.ev[:SPECIAL_DEFENSE] = 26772
pkmn.ev[:DEFENSE] = 30338
pkmn.ev[:SPEED] = 22245
  pkmn.calc_stats
  elsif rand(18)==8
  pkmn.species = :SCIZOR
  pkmn.name = "Lilac"
  pkmn.level = 40
pkmn.happiness = 255
pkmn.learn_move(:FALSESWIPE)
pkmn.learn_move(:FLY)
pkmn.learn_move(:METALCLAW)
pkmn.learn_move(:GUILLOTINE)
pkmn.item = :QUICKCLAW
pkmn.owner.id = 57002
pkmn.owner.name = "SNOW"
pkmn.obtain_text = "National Park"
pkmn.iv[:HP] = 31
pkmn.iv[:ATTACK] = 2
pkmn.iv[:SPECIAL_ATTACK] = 26
pkmn.iv[:SPECIAL_DEFENSE] = 26
pkmn.iv[:DEFENSE] = 22
pkmn.iv[:SPEED] = 22
pkmn.ev[:HP] = 4404
pkmn.ev[:ATTACK] = 7562
pkmn.ev[:SPECIAL_ATTACK] = 26772
pkmn.ev[:SPECIAL_DEFENSE] = 26772
pkmn.ev[:DEFENSE] = 4818
pkmn.ev[:SPEED] = 4968
  pkmn.calc_stats
  elsif rand(18)==9
  pkmn.species = :GYARADOS
  pkmn.name = "Finn"
  pkmn.level = 35
pkmn.happiness = 255
pkmn.shiny = true
pkmn.learn_move(:WHIRLPOOL)
pkmn.learn_move(:SURF)
pkmn.learn_move(:STRENGTH)
pkmn.learn_move(:ROCKSMASH)
pkmn.item = :EXPSHARE
pkmn.owner.id = 57002
pkmn.owner.name = "SNOW"
pkmn.obtain_text = "Route 3 @ Night"
pkmn.iv[:HP] = 16
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 10
pkmn.iv[:SPECIAL_DEFENSE] = 10
pkmn.iv[:DEFENSE] = 10
pkmn.iv[:SPEED] = 10
pkmn.ev[:HP] = 7422
pkmn.ev[:ATTACK] = 5570
pkmn.ev[:SPECIAL_ATTACK] = 5325
pkmn.ev[:SPECIAL_DEFENSE] = 5325
pkmn.ev[:DEFENSE] = 5200
pkmn.ev[:SPEED] = 5117
  pkmn.calc_stats
  elsif rand(18)==10
  pkmn.species = :VENUSAUR
  pkmn.name = "Sunflower"
  pkmn.level = 41
pkmn.happiness = 255
pkmn.learn_move(:GIGADRAIN)
pkmn.learn_move(:RAZORLEAF)
pkmn.learn_move(:LEECHSEED)
pkmn.learn_move(:ANCIENTPOWER)
pkmn.item = :EXPSHARE
pkmn.owner.id = 57002
pkmn.owner.name = "SNOW"
pkmn.obtain_text = "Ilex Forest @ Day"
pkmn.iv[:HP] = 0
pkmn.iv[:ATTACK] = 20
pkmn.iv[:SPECIAL_ATTACK] = 4
pkmn.iv[:SPECIAL_DEFENSE] = 4
pkmn.iv[:DEFENSE] = 12
pkmn.iv[:SPEED] = 12
pkmn.ev[:HP] = 5314
pkmn.ev[:ATTACK] = 6199
pkmn.ev[:SPECIAL_ATTACK] = 5341
pkmn.ev[:SPECIAL_DEFENSE] = 5341
pkmn.ev[:DEFENSE] = 6214
pkmn.ev[:SPEED] = 5689
  pkmn.calc_stats
  elsif rand(18)==11
  pkmn.species = :VAPOREON
  pkmn.name = "Noel"
  pkmn.level = 32
pkmn.happiness = 255
pkmn.learn_move(:ICEBEAM)
pkmn.learn_move(:BITE)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:HEADBUTT)
pkmn.item = :EXPSHARE
pkmn.owner.id = 57002
pkmn.owner.name = "SNOW"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 18
pkmn.iv[:ATTACK] = 26
pkmn.iv[:SPECIAL_ATTACK] = 10
pkmn.iv[:SPECIAL_DEFENSE] = 10
pkmn.iv[:DEFENSE] = 28
pkmn.iv[:SPEED] = 8
pkmn.ev[:HP] = 2566
pkmn.ev[:ATTACK] = 2852
pkmn.ev[:SPECIAL_ATTACK] = 2838
pkmn.ev[:SPECIAL_DEFENSE] = 2838
pkmn.ev[:DEFENSE] = 2522
pkmn.ev[:SPEED] = 3083
  pkmn.calc_stats
  elsif rand(18)==12
  pkmn.species = :WOBBUFFET
  pkmn.level = 10
pkmn.happiness = 255
pkmn.owner.id = 56656
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Dark Cave @ Night"
pkmn.learn_move(:COUNTER)
pkmn.learn_move(:MIRRORCOAT)
pkmn.learn_move(:SAFEGUARD)
pkmn.learn_move(:DESTINYBOND)
pkmn.item = :EXPSHARE
pkmn.iv[:HP] = 31
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 31
pkmn.iv[:SPECIAL_DEFENSE] = 31
pkmn.iv[:DEFENSE] = 14
pkmn.iv[:SPEED] = 26
  pkmn.calc_stats
  elsif rand(18)==13
  pkmn.species = :ONIX
  pkmn.level = 16
pkmn.happiness = 255
pkmn.owner.name = "TWIGS"
pkmn.obtain_text = "Granite Cave"
pkmn.learn_move(:IRONTAIL)
pkmn.learn_move(:EXPLOSION)
pkmn.learn_move(:FLAMETHROWER)
pkmn.learn_move(:DIG)
pkmn.iv[:HP] = 28
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 0
pkmn.iv[:SPECIAL_DEFENSE] = 0
pkmn.iv[:DEFENSE] = 31
pkmn.iv[:SPEED] = 31
  pkmn.calc_stats
  elsif rand(18)==14
  pkmn.species = :MAGNEMITE
  pkmn.level = 5
pkmn.happiness = 255
pkmn.owner.id = 56656
pkmn.shiny = true
pkmn.owner.name = "ADALYNN"
pkmn.obtain_text = "Route 34 @ Day"
pkmn.iv[:HP] = 0
pkmn.iv[:ATTACK] = 4
pkmn.iv[:SPECIAL_ATTACK] = 20
pkmn.iv[:SPECIAL_DEFENSE] = 20
pkmn.iv[:DEFENSE] = 20
pkmn.iv[:SPEED] = 20
  pkmn.calc_stats
  elsif rand(18)==14
  pkmn.species = :SKARMORY
  pkmn.level = 100
pkmn.happiness = 255
pkmn.learn_move(:DRILLPECK)
pkmn.learn_move(:STEELWING)
pkmn.learn_move(:RETURN)
pkmn.learn_move(:SPIKES)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 28
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 0
pkmn.iv[:SPECIAL_DEFENSE] = 0
pkmn.iv[:DEFENSE] = 18
pkmn.iv[:SPEED] = 31
pkmn.ev[:HP] = 65535
pkmn.ev[:ATTACK] = 65535
pkmn.ev[:SPECIAL_ATTACK] = 65535
pkmn.ev[:SPECIAL_DEFENSE] = 65535
pkmn.ev[:DEFENSE] = 65535
pkmn.ev[:SPEED] = 65535
  pkmn.calc_stats
  elsif rand(18)==15
  pkmn.species = :DRAGONITE
  pkmn.name = "Wyrmheim"
  pkmn.level = 100
pkmn.item = :KINGSROCK
pkmn.happiness = 255
pkmn.learn_move(:WATERFALL)
pkmn.learn_move(:OUTRAGE)
pkmn.learn_move(:EXTREMESPEED)
pkmn.learn_move(:HYPERBEAM)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 31
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 22
pkmn.iv[:SPECIAL_DEFENSE] = 22
pkmn.iv[:DEFENSE] = 31
pkmn.iv[:SPEED] = 22
pkmn.ev[:HP] = 65535
pkmn.ev[:ATTACK] = 65535
pkmn.ev[:SPECIAL_ATTACK] = 65535
pkmn.ev[:SPECIAL_DEFENSE] = 65535
pkmn.ev[:DEFENSE] = 65535
pkmn.ev[:SPEED] = 65535
  pkmn.calc_stats
  elsif rand(18)==16
  pkmn.species = :ALAKAZAM
  pkmn.name = "Wyrmheim"
  pkmn.level = 100
pkmn.item = :AMULETCOIN
pkmn.happiness = 255
pkmn.learn_move(:PSYCHIC)
pkmn.learn_move(:ICEPUNCH)
pkmn.learn_move(:THIEF)
pkmn.learn_move(:RECOVER)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 31
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 18
pkmn.iv[:SPECIAL_DEFENSE] = 18
pkmn.iv[:DEFENSE] = 22
pkmn.iv[:SPEED] = 14
pkmn.ev[:HP] = 65535
pkmn.ev[:ATTACK] = 65535
pkmn.ev[:SPECIAL_ATTACK] = 65535
pkmn.ev[:SPECIAL_DEFENSE] = 65535
pkmn.ev[:DEFENSE] = 65535
pkmn.ev[:SPEED] = 65535
  pkmn.calc_stats
  elsif rand(18)==16
  pkmn.species = :PORYGON2
  pkmn.name = "Big Duckum"
  pkmn.level = 100
pkmn.item = :LEFTOVERS
pkmn.happiness = 255
pkmn.learn_move(:ICEBEAM)
pkmn.learn_move(:TRIATTACK)
pkmn.learn_move(:RECOVER)
pkmn.learn_move(:THUNDERBOLT)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 24
pkmn.iv[:ATTACK] = 10
pkmn.iv[:SPECIAL_ATTACK] = 16
pkmn.iv[:SPECIAL_DEFENSE] = 16
pkmn.iv[:DEFENSE] = 22
pkmn.iv[:SPEED] = 24
pkmn.ev[:HP] = 65535
pkmn.ev[:ATTACK] = 65535
pkmn.ev[:SPECIAL_ATTACK] = 65535
pkmn.ev[:SPECIAL_DEFENSE] = 65535
pkmn.ev[:DEFENSE] = 65535
pkmn.ev[:SPEED] = 65535
  pkmn.calc_stats
  elsif rand(18)==17
  pkmn.species = :UMBREON
  pkmn.level = 100
pkmn.item = :LUCKYEGG
pkmn.happiness = 255
pkmn.learn_move(:FEINTATTACK)
pkmn.learn_move(:CONFUSERAY)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:TRIATTACK)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 31
pkmn.iv[:ATTACK] = 31
pkmn.iv[:SPECIAL_ATTACK] = 22
pkmn.iv[:SPECIAL_DEFENSE] = 22
pkmn.iv[:DEFENSE] = 5
pkmn.iv[:SPEED] = 14
pkmn.ev[:HP] = 27371
pkmn.ev[:ATTACK] = 27713
pkmn.ev[:SPECIAL_ATTACK] = 34838
pkmn.ev[:SPECIAL_DEFENSE] = 34838
pkmn.ev[:DEFENSE] = 28591
pkmn.ev[:SPEED] = 29979
  pkmn.calc_stats
  elsif rand(18)==18
  pkmn.species = :TOGETIC
  pkmn.level = 100
pkmn.happiness = 255
pkmn.learn_move(:FEINTATTACK)
pkmn.learn_move(:CONFUSERAY)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:TRIATTACK)
pkmn.owner.id = 57002
pkmn.owner.name = "POTS"
pkmn.obtain_text = "Goldenrod City @ Night"
pkmn.iv[:HP] = 0
pkmn.iv[:ATTACK] = 0
pkmn.iv[:SPECIAL_ATTACK] = 20
pkmn.iv[:SPECIAL_DEFENSE] = 20
pkmn.iv[:DEFENSE] = 28
pkmn.iv[:SPEED] = 20
pkmn.ev[:HP] = 46545
pkmn.ev[:ATTACK] = 49253
pkmn.ev[:SPECIAL_ATTACK] = 54185
pkmn.ev[:SPECIAL_DEFENSE] = 54185
pkmn.ev[:DEFENSE] = 53860
pkmn.ev[:SPEED] = 45329
  pkmn.calc_stats
end
end