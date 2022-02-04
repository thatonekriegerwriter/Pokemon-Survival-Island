

class PokeBattle_Battler

 def pbObedienceCheck?(choice)
    return true if usingMultiTurnAttack?
    return true if choice[0]!=:UseMove
    return true if !@battle.internalBattle
    return true if !@battle.pbOwnedByPlayer?(@index)
    disobedient = false
    # Pokémon may be disobedient; calculate if it is
    badgeLevel = 10 * (@battle.pbPlayer.badge_count + 1)
    r = @battle.pbRandom(256)
    badgeLevel = GameData::GrowthRate.max_level if @battle.pbPlayer.badge_count >= 8
    if @pokemon.foreign?(@battle.pbPlayer) && @level>badgeLevel
      a = ((@level+badgeLevel)*@battle.pbRandom(256)/256).floor
      disobedient |= (a>=badgeLevel)
    end
#EDIT
    return pbDisobey(choice, badgeLevel) if @pokemon.loyalty == 0 && rand(255)<= 75
    return pbDisobey(choice, badgeLevel) if @pokemon.loyalty <= 49 && rand(255)<= 50
    return pbDisobey(choice, badgeLevel) if @pokemon.loyalty <= 74 && rand(255)<= 25
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 149 && @pokemon.loyalty == 0 && r <= 50
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 149 && @pokemon.loyalty == 49 && r <= 25
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 149 && @pokemon.loyalty == 74 && r <= 20
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 199 && @pokemon.loyalty == 0 && r <= 45
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 199 && @pokemon.loyalty == 49 && r <= 25
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 199 && @pokemon.loyalty == 74 && r <= 15
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 249 && @pokemon.loyalty == 0 && r <= 40
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 249 && @pokemon.loyalty == 49 && r <= 25
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness >= 249 && @pokemon.loyalty == 74 && r <= 10
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness == 250 && @pokemon.loyalty == 0 && r <= 35
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness == 250 && @pokemon.loyalty == 49 && r <= 25
    return pbDisobey(choice, badgeLevel) if @pokemon.happiness == 250 && @pokemon.loyalty == 74 && r <= 5
#END EDIT
    disobedient |= !pbHyperModeObedience(choice[2])
    return true if !disobedient
    # Pokémon is disobedient; make it do something else
    return pbDisobey(choice,badgeLevel)
  end


  def pbDisobey(choice,badgeLevel)
    move = choice[2]
    PBDebug.log("[Disobedience] #{pbThis} disobeyed")
    @effects[PBEffects::Rage] = false
    # Do nothing if using Snore/Sleep Talk
    if @status == :SLEEP && move.usableWhenAsleep?
      @battle.pbDisplay(_INTL("{1} ignored orders and kept sleeping!",pbThis))
      return false
    end
    c = @level-badgeLevel
    r = @battle.pbRandom(256)
    # Fall asleep
    if r <= 10  && pbCanSleep?(self,false)
      pbSleepSelf(_INTL("{1} began to nap!",pbThis))
      return false
    end
    # Hurt self in confusion
    if r <= 10 && @status != :SLEEP
      pbConfusionDamage(_INTL("{1} won't obey! It hurt itself in its confusion!",pbThis))
      return false
    end
    #EDIT
    if r <= 10 && @status != :SLEEP
      @battle.pbDisplay(_INTL("{1} turned around and attacked you!",pbThis))
      $game_variables[225] -= 5
      return false 
    end
    if r <= 10 && @status != :SLEEP
      @battle.pbDisplay(_INTL("{1} turned around rushed you down, hurting you!",pbThis))
      $game_variables[225] -= 15
      return false 
    end
    # Use another move
    if r <= 10 && @status != :SLEEP
      @battle.pbDisplay(_INTL("{1} ignored orders!",pbThis))
      return false if !@battle.pbCanShowFightMenu?(@index)
      otherMoves = []
      eachMoveWithIndex do |_m,i|
        next if i==choice[1]
        otherMoves.push(i) if @battle.pbCanChooseMove?(@index,i,false)
      end
      return false if otherMoves.length==0   # No other move to use; do nothing
      newChoice = otherMoves[@battle.pbRandom(otherMoves.length)]
      choice[1] = newChoice
      choice[2] = @moves[newChoice]
      choice[3] = -1
      return true
    end
    # Show refusal message and do nothing
    case @battle.pbRandom(4)
    when 0 then @battle.pbDisplay(_INTL("{1} won't obey!",pbThis))
    when 1 then @battle.pbDisplay(_INTL("{1} turned away!",pbThis))
    when 2 then @battle.pbDisplay(_INTL("{1} is loafing around!",pbThis))
    when 3 then @battle.pbDisplay(_INTL("{1} pretended not to notice!",pbThis))
    end
    return false
  end
  
end

Events.onStepTaken += proc {
  $PokemonGlobal.loyaltySteps = 0 if !$PokemonGlobal.loyaltySteps
  $PokemonGlobal.loyaltySteps += 1
  if $PokemonGlobal.loyaltySteps>=128
    for pkmn in $Trainer.able_party
      pkmn.changeLoyalty("walking") if rand(2)==0
    end
    $PokemonGlobal.loyaltySteps = 0
  end
}


class HappinessHandlerHash < HandlerHash2
end

module BattleHandlers
  PriorityBracketHappy           = HappinessHandlerHash.new   # None!
  
  def self.triggerPriorityBracketHappy(battler,battle)
    PriorityBracketHappy.trigger(battler,battle)
  end
end  

  # Quick Claw, Custap Berry's "X let it move first!" message.
  def pbAttackPhasePriorityChangeMessages
    pbPriority.each do |b|
      if b.effects[PBEffects::PriorityAbility] && b.abilityActive?
        BattleHandlers.triggerPriorityBracketUseAbility(b.ability,b,self)
      elsif b.effects[PBEffects::PriorityItem] && b.itemActive?
        BattleHandlers.triggerPriorityBracketUseItem(b.item,b,self)
      elsif battler.happiness >=0
        BattleHandlers.triggerPriorityBracketHappy(b,self)
      end
    end
  end
  