class PokemonSystem
  attr_accessor :opponent_damage
  attr_accessor :player_damage

  alias __dmg_scale_initialize initialize
  def initialize
    __dmg_scale_initialize
    @opponent_damage = 1
    @player_damage = 1
  end
  
  def opponent_damage
    @opponent_damage = 1 unless @opponent_damage
    return @opponent_damage
  end
  
  def player_damage
    @player_damage = 1 unless @player_damage
    return @player_damage
  end
end

class PokemonOption_Scene
  alias __dmg_scale_pbAddOnOptions pbAddOnOptions
  def pbAddOnOptions(options)
    options.push(
      EnumOption.new(_INTL("Opponent DMG"),[_INTL("50%"),_INTL("100%"),_INTL("150%"),_INTL("200%")],
         proc { $PokemonSystem.opponent_damage },
         proc { |value| $PokemonSystem.opponent_damage = value}
       )
    )
    options.push(
      EnumOption.new(_INTL("Player DMG"),[_INTL("50%"),_INTL("100%"),_INTL("150%"),_INTL("200%")],
         proc { $PokemonSystem.player_damage },
         proc { |value| $PokemonSystem.player_damage = value}
       )
    )
    return options
  end
end

class PokeBattle_Move
  alias __dmg_scale_pbCalcDamageMultipliers pbCalcDamageMultipliers
  def pbCalcDamageMultipliers(user,target,numTargets,type,baseDmg,multipliers)
    __dmg_scale_pbCalcDamageMultipliers(user,target,numTargets,type,baseDmg,multipliers)
    dmg = (user.opposes?) ? $PokemonSystem.opponent_damage : $PokemonSystem.player_damage
    multipliers[:final_damage_multiplier]*= [0.5,1.0,1.5,2.0][dmg]
  end
end