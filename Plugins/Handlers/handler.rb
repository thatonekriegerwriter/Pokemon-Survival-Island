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

if $PokemonSystem.autosave == 0
  $game_switches[52]==true 
end

if $PokemonSystem.autosave == 1
  $game_switches[52]==false 
end
}

