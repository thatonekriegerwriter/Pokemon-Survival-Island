def pbCCEncounters(war)

if $Trainer.name=="ADALYNN"||$Trainer.name=="Adalynn"||$Trainer.name=="adalynn"
if war==0
pkmn = Pokemon.new(:VULPIX, 80)
pkmn.happiness = 255
pkmn.learn_move(:FLAMETHROWER)
pkmn.learn_move(:HEADBUTT)
pkmn.learn_move(:FIREBLAST)
pkmn.learn_move(:AURORABEAM)
pkmn.item = :LUCKYEGG
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
elsif war==1
pkmn = Pokemon.new(:POLITOED, 81)
pkmn.happiness = 255
pkmn.learn_move(:SURF)
pkmn.learn_move(:LOVELYKISS)
pkmn.learn_move(:CROSSCHOP)
pkmn.learn_move(:WHIRLPOOL)
pkmn.item = :LUCKYEGG
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
elsif war==2
pkmn = Pokemon.new(:DRAGONITE, 80)
pkmn.happiness = 255
pkmn.learn_move(:HYPERBEAM)
pkmn.learn_move(:THUNDERBOLT)
pkmn.learn_move(:EARTHQUAKE)
pkmn.learn_move(:OUTRAGE)
pkmn.item = :LUCKYEGG
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
elsif war==3
pkmn = Pokemon.new(:ESPEON, 80)
pkmn.happiness = 255
pkmn.learn_move(:PSYBEAM)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:PSYCHIC)
pkmn.learn_move(:PSYCHUP)
pkmn.item = :LUCKYEGG
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
elsif war==4
pkmn = Pokemon.new(:CROBAT, 80)
pkmn.happiness = 255
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
elsif war==5
pkmn = Pokemon.new(:DONPHAN, 80)
pkmn.happiness = 255
pkmn.learn_move(:FLAMETHROWER)
pkmn.learn_move(:HEADBUTT)
pkmn.learn_move(:FIREBLAST)
pkmn.learn_move(:AURORABEAM)
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
end
elsif $Trainer.name=="SNOW"||$Trainer.name=="Snow"||$Trainer.name=="snow"
if war==0
pkmn = Pokemon.new(:VULPIX, 80)
pkmn.happiness = 255
pkmn.learn_move(:FLAMETHROWER)
pkmn.learn_move(:HEADBUTT)
pkmn.learn_move(:FIREBLAST)
pkmn.learn_move(:AURORABEAM)
pkmn.item = :LUCKYEGG
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
elsif war==1
pkmn = Pokemon.new(:POLITOED, 81)
pkmn.happiness = 255
pkmn.learn_move(:SURF)
pkmn.learn_move(:LOVELYKISS)
pkmn.learn_move(:CROSSCHOP)
pkmn.learn_move(:WHIRLPOOL)
pkmn.item = :LUCKYEGG
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
elsif war==2
pkmn = Pokemon.new(:DRAGONITE, 80)
pkmn.happiness = 255
pkmn.learn_move(:HYPERBEAM)
pkmn.learn_move(:THUNDERBOLT)
pkmn.learn_move(:EARTHQUAKE)
pkmn.learn_move(:OUTRAGE)
pkmn.item = :LUCKYEGG
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
elsif war==3
pkmn = Pokemon.new(:ESPEON, 80)
pkmn.happiness = 255
pkmn.learn_move(:PSYBEAM)
pkmn.learn_move(:SANDATTACK)
pkmn.learn_move(:PSYCHIC)
pkmn.learn_move(:PSYCHUP)
pkmn.item = :LUCKYEGG
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
elsif war==4
pkmn = Pokemon.new(:CROBAT, 80)
pkmn.happiness = 255
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
elsif war==5
pkmn = Pokemon.new(:DONPHAN, 80)
pkmn.happiness = 255
pkmn.learn_move(:FLAMETHROWER)
pkmn.learn_move(:HEADBUTT)
pkmn.learn_move(:FIREBLAST)
pkmn.learn_move(:AURORABEAM)
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
end
pbWildBattleCore(pkmn)
end