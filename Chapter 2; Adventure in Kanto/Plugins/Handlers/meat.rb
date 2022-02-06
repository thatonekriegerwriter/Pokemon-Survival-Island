def pbCookMeat
     Kernel.pbMessage(_INTL("You decide to use this POKeMON for food."))
     case $game_variables[1]
	   when "Magikarp"
        $Trainer.remove_pokemon_at_index(pbGet(1))
	    Kernel.pbMessage(_INTL("Wow, there is no meat on the Magikarp."))
	   when "Snorlax"
        $Trainer.remove_pokemon_at_index(pbGet(1))
		Kernel.pbReceiveItem(:MEAT,4)
	   else
	    Kernel.pbReceiveItem(:MEAT,(rand(6)))
	  end
end