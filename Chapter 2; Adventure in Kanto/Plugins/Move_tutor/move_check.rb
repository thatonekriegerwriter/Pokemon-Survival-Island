MOVETUTOR=35
#Everything below is just here to check if your pokémons can learn moves 
def eggMoves(pkmn)
    babyspecies=pkmn.species
    babyspecies = GameData::Species.get(babyspecies).get_baby_species(false, nil, nil)
    eggmoves=GameData::Species.get_species_form(babyspecies, pkmn.form).egg_moves
    return eggmoves
end
  
def getMoveList
    return species_data.moves
end
  
def tutorMoves(pkmn)
    return pkmn.species_data.tutor_moves
end
   
def pbGetRelearnableMoves(pkmn)
    return [] if !pkmn || pkmn.egg? || pkmn.shadowPokemon?
    moves = []
    pkmn.getMoveList.each do |m|
      next if m[0] > pkmn.level || pkmn.hasMove?(m[1])
      moves.push(m[1]) if !moves.include?(m[1])
    end
    tmoves = []
    if pkmn.first_moves
      for i in pkmn.first_moves
        tmoves.push(i) if !pkmn.hasMove?(i) && !moves.include?(i)
      end
    end
	if $game_variables[MOVETUTOR]==0				#modify to == if you want to make distinct NPCs
    moves = tmoves + moves  
	end
    # add tutor moves and eggmoves
    if $game_variables[MOVETUTOR]==1				#modify to == if you want to make distinct NPCs
      eggmoves=eggMoves(pkmn)
	  for i in eggmoves
        moves.push(i) if !pkmn.hasMove?(i) && !moves.include?(i)
      end
    end
    if $game_variables[MOVETUTOR]==2				#modify to == if you want to make distinct NPCs
      tutormoves= tutorMoves(pkmn)
	  for i in tutormoves
        moves.push(i) if !pkmn.hasMove?(i) && !moves.include?(i)
      end
    end
	if $game_variables[MOVETUTOR]==3
	  hmoves = hackmoves
	  for i in hmoves
        moves.push(i) if !pkmn.hasMove?(i) && !moves.include?(i)
      end
	end
    moves.sort! { |a, b| a.downcase <=> b.downcase } #sort moves alphabetically
    return moves | []   # remove duplicates
end
  
def can_learn_move(pkmn)
	return false if pkmn.egg? || pkmn.shadowPokemon?
	return true if $game_variables[MOVETUTOR]==3
	moves = pbGetRelearnableMoves(pkmn)
    if moves!=[]
	 return true
	else
	 return false
	end
end 