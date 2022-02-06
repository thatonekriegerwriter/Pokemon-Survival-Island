def pbCookMeat
     Kernel.pbMessage(_INTL("You decide to use this POKeMON for food."))
     case $game_variables[1]
	   when ":MAGIKARP"
        $Trainer.remove_pokemon_at_index(pbGet(1))
	    Kernel.pbMessage(_INTL("Wow, there is no meat on the Magikarp."))
	   when ":SNORLAX"
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,4)
	   else
        $Trainer.remove_pokemon_at_index(pbGet(1))
	    Kernel.pbReceiveItem(:MEAT,(rand(6)))
	  end
end