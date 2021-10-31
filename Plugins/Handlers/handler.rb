Events.onStepTakenTransferPossible+=proc {

if $PokemonBag.pbHasItem?(:SPRINKLER)
  $game_switches[410]==true 
end

if $PokemonBag.pbHasItem?(:COALGENERATOR)
  $game_switches[409]==true 
end


if $PokemonBag.pbHasItem?(:UPGRADEDCRAFTINGBENCH)
  $game_switches[402]==true 
end

if $PokemonBag.pbHasItem?(:MEDICINEPOT)
  $game_switches[405]==true 
end

if $PokemonBag.pbHasItem?(:FURNACE)
  $game_switches[403]==true 
end

if $PokemonBag.pbHasItem?(:CAULDRON)
  $game_switches[147]==true 
end

if $PokemonBag.pbHasItem?(:CRAFTINGBENCH)
  $game_switches[150]==true 
end

if $PokemonBag.pbHasItem?(:APRICORNCRAFTING)
  $game_switches[144]==true 
end

if $PokemonBag.pbHasItem?(:PORTABLEPC)
  $game_switches[406]==true 
end

if $PokemonBag.pbHasItem?(:BEDROLL)
  $game_switches[407]==true 
end

if $PokemonBag.pbHasItem?(:SEWINGMACHINE)
  $game_switches[411]==true 
end

if $PokemonBag.pbHasItem?(:ELECTRICPRESS)
  $game_switches[412]==true 
end

if $game_variables[256]==(:GHOSTMAIL) && rand(100) == 5
  $game_variables[208]+=1
end

if !$game_switches[54]==true 
 if $PokemonSystem.survivalmode == 0
   Achievements.incrementProgress("SURVIVOR",1)
   $game_switches[54]==true 
 end
end

if $PokemonSystem.nuzlockemode == 0
 if $game_switches[57]==false
  EliteBattle.startNuzlocke
  pbMessage(_INTL("You toggled Nuzlocke Mode."))
  Achievements.incrementProgress("NUZLOCKED",1)
 else
  EliteBattle.toggle_nuzlocke
  pbMessage(_INTL("You toggled Nuzlocke Mode."))
 end
end

}

def GrassEvolutionStone
  case $game_variables[3]
     when :GLOOM
	     $game_variables[4] = 1
     when :WEEPINGBELL
	     $game_variables[4] = 2
     when :EXEGGCUTE 
	     $game_variables[4] = 3
     when :EEVEE
	     $game_variables[4] = 4
     when :NUZLEAF
	     $game_variables[4] = 5
     when :PANSAGE
	     $game_variables[4] = 6
     when :CHERUBI
	     $game_variables[4] = 7
	 else
	     $game_variables[4] = 0
  end
if $game_variables[4]== 0
    Kernel.pbMessage(_INTL("That does not seem to be able to evolve with this stone."))
end
if $game_variables[4]== 1
    Kernel.pbMessage(_INTL("Gloom evolves into Vileplume."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:VILEPLUME)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 2
    Kernel.pbMessage(_INTL("Weepingbell evolves into Victorybell."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:VECTREEBEL)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 3
    Kernel.pbMessage(_INTL("Exeggcute evolves into Exeggcutor."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:EXEGGCUTOR)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 4
    Kernel.pbMessage(_INTL("Eevee evolves into Leafeon."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:LEAFEON)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 5
    Kernel.pbMessage(_INTL("Nuzleaf evolves into Shiftry."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:SHIFTRY)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 6
    Kernel.pbMessage(_INTL("Pansage evolves into Semisage."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:SEMISAGE)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
end
if $game_variables[4]== 7
    Kernel.pbMessage(_INTL("Cherubi normally evolves into Cherrim."))
	pkmn=$trainer.party[$game_variables[1]]
	pbFadeOutInWithMusic {
    evo = PokemonEvolutionScene.new
    evo.pbStartScreen(pbGetPokemon(1),:STEENEE)
    evo.pbEvolution(false)
    evo.pbEndScreen
}
    Kernel.pbMessage(_INTL("OH! How abnormal!"))
end
end