

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
#    return pbDisobey(choice,badgeLevel)
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
    r = @battle.pbRandom(90)
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
    if r <= 20 && r >= 10 && @status != :SLEEP && @pokemon.happiness <= 149
      @battle.pbDisplay(_INTL("{1} turned around and attacked you!",pbThis))
      $game_variables[225] -= 5
      return false 
    end
    if r <= 20 && r >= 10 && @status != :SLEEP && @pokemon.happiness >= 199
      @battle.pbDisplay(_INTL("{1} wants to play!",pbThis))
      return false 
    end
    if r <= 30 && r >= 20 && @status != :SLEEP && @pokemon.happiness <= 50
      @battle.pbDisplay(_INTL("{1} turned around rushed you down, hurting you!",pbThis))
      $game_variables[225] -= 15
      return false 
    end
    if r <= 30 && r >= 20 && @status != :SLEEP && @pokemon.happiness >= 200
      @battle.pbDisplay(_INTL("{1} wants you to praise it before it does anything!",pbThis))
      return false 
    end
    # Use another move
    if (r <= 40 && r >= 30 && @status != :SLEEP) || (r <= 40 && r >= 30 && @status != :SLEEP  && @pokemon.happiness >= 199)
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
      pkmn.changeLoyalty("walking",pkmn) if rand(2)==0
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
      elsif battler.happiness >=200
        BattleHandlers.triggerPriorityBracketHappy(b,self)
      end
    end
  end
  
  
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
      elsif battler.happiness >=200
        BattleHandlers.triggerPriorityBracketHappy(b,self)
      end
    end
  end

  class PokeBattle_Move
    def pbEndureKOMessage(target)
    if target.damageState.disguise
      @battle.pbShowAbilitySplash(target)
      if PokeBattle_SceneConstants::USE_ABILITY_SPLASH
        @battle.pbDisplay(_INTL("Its disguise served it as a decoy!"))
      else
        @battle.pbDisplay(_INTL("{1}'s disguise served it as a decoy!",target.pbThis))
      end
      @battle.pbHideAbilitySplash(target)
      target.pbChangeForm(1,_INTL("{1}'s disguise was busted!",target.pbThis))
      target.pbReduceHP(target.totalhp/8)
    elsif target.damageState.iceface
      @battle.pbShowAbilitySplash(target)
      target.pbChangeForm(1,_INTL("{1} transformed!",target.pbThis))
      @battle.pbHideAbilitySplash(target)
    elsif target.damageState.endured
      @battle.pbDisplay(_INTL("{1} endured the hit!",target.pbThis))
    elsif target.damageState.sturdy
      @battle.pbShowAbilitySplash(target)
      if PokeBattle_SceneConstants::USE_ABILITY_SPLASH
        @battle.pbDisplay(_INTL("{1} endured the hit!",target.pbThis))
      else
        @battle.pbDisplay(_INTL("{1} hung on with Sturdy!",target.pbThis))
      end
      @battle.pbHideAbilitySplash(target)
    elsif target.damageState.focusSash
      @battle.pbCommonAnimation("UseItem",target)
      @battle.pbDisplay(_INTL("{1} hung on using its Focus Sash!",target.pbThis))
      target.pbConsumeItem
    elsif target.damageState.focusBand
      @battle.pbCommonAnimation("UseItem",target)
      @battle.pbDisplay(_INTL("{1} hung on using its Focus Band!",target.pbThis))
    end
  end
  end
  
  class PokeBattle_Battler
  attr_accessor :loyalty
  attr_accessor :happiness
  
    def pbEndOfBattle
    oldDecision = @decision
    @decision = 4 if @decision==1 && wildBattle? && @caughtPokemon.length>0
    case oldDecision
    ##### WIN #####
    when 1
      PBDebug.log("")
      PBDebug.log("***Player won***")
      if trainerBattle?
        @scene.pbTrainerBattleSuccess
        case @opponent.length
        when 1
          pbDisplayPaused(_INTL("You defeated {1}!",@opponent[0].full_name))
        when 2
          pbDisplayPaused(_INTL("You defeated {1} and {2}!",@opponent[0].full_name,
             @opponent[1].full_name))
        when 3
          pbDisplayPaused(_INTL("You defeated {1}, {2} and {3}!",@opponent[0].full_name,
             @opponent[1].full_name,@opponent[2].full_name))
        end
        @opponent.each_with_index do |_t,i|
          @scene.pbShowOpponent(i)
          msg = (@endSpeeches[i] && @endSpeeches[i]!="") ? @endSpeeches[i] : "..."
          pbDisplayPaused(msg.gsub(/\\[Pp][Nn]/,pbPlayer.name))
        end
      end
      # Gain money from winning a trainer battle, and from Pay Day
      pbGainMoney if @decision!=4
      # Hide remaining trainer
      @scene.pbShowOpponent(@opponent.length) if trainerBattle? && @caughtPokemon.length>0
    ##### LOSE, DRAW #####
    when 2, 5
      PBDebug.log("")
      PBDebug.log("***Player lost***") if @decision==2
      PBDebug.log("***Player drew with opponent***") if @decision==5
      if @internalBattle
        pbDisplayPaused(_INTL("You have no more Pokémon that can fight!"))
        if trainerBattle?
          case @opponent.length
          when 1
            pbDisplayPaused(_INTL("You lost against {1}!",@opponent[0].full_name))
          when 2
            pbDisplayPaused(_INTL("You lost against {1} and {2}!",
               @opponent[0].full_name,@opponent[1].full_name))
          when 3
            pbDisplayPaused(_INTL("You lost against {1}, {2} and {3}!",
               @opponent[0].full_name,@opponent[1].full_name,@opponent[2].full_name))
             end
        end
        if wildBattle?
          foeParty = pbParty(1)
          case foeParty.length
            when 1
            pbDisplayPaused(_INTL("The Wild {1} started charging at you!",foeParty[0].name))
          when 2
            pbDisplayPaused(_INTL("Oh! A wild {1} and {2} started charging at you!",foeParty[0].name,
               foeParty[1].name))
          when 3
            pbDisplayPaused(_INTL("The Wild {1}, {2} and {3} all started charging at once!",foeParty[0].name,
               foeParty[1].name,foeParty[2].name))
          end
      end
        # Lose money from losing a battle
        #EDIT
        $Trainer.playerhealth += rand(30)
        pbLoseMoney
        pbDisplayPaused(_INTL("You blacked out!")) if !@canLose
      elsif @decision==2
        if @opponent
          @opponent.each_with_index do |_t,i|
            @scene.pbShowOpponent(i)
            msg = (@endSpeechesWin[i] && @endSpeechesWin[i]!="") ? @endSpeechesWin[i] : "..."
            pbDisplayPaused(msg.gsub(/\\[Pp][Nn]/,pbPlayer.name))
          end
        end
      end
    ##### CAUGHT WILD POKÉMON #####
    when 4
      @scene.pbWildBattleSuccess if !Settings::GAIN_EXP_FOR_CAPTURE
    end
    # Register captured Pokémon in the Pokédex, and store them
    pbRecordAndStoreCaughtPokemon
    # Collect Pay Day money in a wild battle that ended in a capture
    pbGainMoney if @decision==4
    # Pass on Pokérus within the party
    if @internalBattle
      infected = []
      $Trainer.party.each_with_index do |pkmn,i|
        infected.push(i) if pkmn.pokerusStage==1
      end
      infected.each do |idxParty|
        strain = $Trainer.party[idxParty].pokerusStrain
        if idxParty>0 && $Trainer.party[idxParty-1].pokerusStage==0
          $Trainer.party[idxParty-1].givePokerus(strain) if rand(3)==0   # 33%
        end
        if idxParty<$Trainer.party.length-1 && $Trainer.party[idxParty+1].pokerusStage==0
          $Trainer.party[idxParty+1].givePokerus(strain) if rand(3)==0   # 33%
        end
      end
    end
    # Clean up battle stuff
    @scene.pbEndBattle(@decision)
    @battlers.each do |b|
      next if !b
      pbCancelChoice(b.index)   # Restore unused items to Bag
      BattleHandlers.triggerAbilityOnSwitchOut(b.ability,b,true) if b.abilityActive?
    end
    pbParty(0).each_with_index do |pkmn,i|
      next if !pkmn
      @peer.pbOnLeavingBattle(self,pkmn,@usedInBattle[0][i],true)   # Reset form
      pkmn.item = @initialItems[0][i]
    end
    return @decision
  end

  #=================
  
  end
  