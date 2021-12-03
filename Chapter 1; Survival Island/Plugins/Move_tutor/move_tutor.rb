class MoveRelearnerScreen
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
	#if $game_variables[34]>=0				#modify here
    moves = tmoves + moves  
	#end
    # add tutor moves and eggmoves
    if $game_variables[34]>=1				#modify here
      eggmoves=eggMoves(pkmn)
      moves = moves + eggmoves
    end
    if $game_variables[34]>=2				#modify here
      tutormoves= tutorMoves(pkmn)
      moves = moves + tutormoves
    end
    moves.sort! { |a, b| a.downcase <=> b.downcase } #sort moves alphabetically
    return moves | []   # remove duplicates
  end
end

  

  

