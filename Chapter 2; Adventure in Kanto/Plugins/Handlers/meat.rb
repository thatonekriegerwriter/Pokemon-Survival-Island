def pbCookMeat


     Kernel.pbMessage(_INTL("You decide to use this POKeMON for food."))
	   if $game_variables[1]== :MAGIKARP
        $Trainer.remove_pokemon_at_index(pbGet(1))
	    Kernel.pbMessage(_INTL("Wow, there is no meat on the Magikarp."))
	   elsif $game_variables[1] == :SNORLAX
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+4))
	   elsif $game_variables[1].type == FLYING
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:BIRDMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == NORMAL
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   elsif $game_variables[1].type == FIGHTING
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   elsif $game_variables[1].type == POISON
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:POISONOUSMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == GROUND
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:ROCKYMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == ROCK
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:ROCKYMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == BUG
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:BUGMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == GHOST
        Kernel.pbMessage(_INTL("You can't kill a ghost."))
	   elsif $game_variables[1].type == STEEL
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:STEELYMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == WATER
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:SUSHI,(rand(3)+1))
	   elsif $game_variables[1].type == GRASS
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:LEAFYMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == ELECTRIC
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   elsif $game_variables[1].type == PSYCHIC
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   elsif $game_variables[1].type == ICE
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:ICEYROCKS,(rand(3)+1))
	   elsif $game_variables[1].type == DRAGON
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:DRAGONMEAT,(rand(3)+1))
	   elsif $game_variables[1].type == DARK
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   elsif $game_variables[1].type == CRYSTAL
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:EDIABLESCRYSTAL,(rand(3)+1))
	   elsif $game_variables[1].type == WIND
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,(rand(3)+1))
	   else
        $Trainer.remove_pokemon_at_index(pbGet(1))
	    Kernel.pbReceiveItem(:MEAT,(rand(6)))
	   end
	  end






