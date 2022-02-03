    # Changing
class Pokemon

  def changeHappiness(method)
    gain = 0
     base = 100 if nature ==   :LOVING
     base = -100 if nature ==   :HATEFUL
     base = -10 if nature ==   :QUIRKY
     base = 0 if nature ==   :CAREFUL
     base = 5 if nature ==   :SASSY
     base = 40 if nature ==   :GENTLE
     base = 10 if nature ==   :CALM
     base = 5 if nature ==   :RASH
     base = 5 if nature ==   :BASHFUL
     base = 5 if nature ==   :QUIET
     base = 10 if nature ==   :MILD
     base = 10 if nature ==   :MODEST
     base = 10 if nature ==   :NAIVE
     base = 50 if nature ==   :JOLLY
     base = -10 if nature ==   :SERIOUS
     base = 15 if nature ==   :HASTY
     base = -5 if nature ==   :TIMID
     base = 25 if nature ==   :LAX
     base = 9 if nature ==   :IMPISH
     base = 30 if nature ==   :RELAXED
     base = 20 if nature ==   :DOCILE
     base = 5 if nature ==   :BOLD
     base = -20 if nature ==   :NAUGHTY
     base = -10 if nature ==   :ADAMANT
     base = 10 if nature ==   :BRAVE
     base = 50 if nature ==   :LONELY
     base = 10 if nature ==   :HARDY
    happiness_range = @happiness / 100
if nature ==   :HARDY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LONELY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BRAVE
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :ADAMANT
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :NAUGHTY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BOLD
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :DOCILE
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :RELAXED
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :IMPISH
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LAX
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :TIMID
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :HASTY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :SERIOUS
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :JOLLY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :NAIVE
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :MODEST
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elselsif nature ==   :MILD
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :QUIET
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BASHFUL
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :RASH
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :CALM
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :GENTLE
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :SASSY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :CAREFUL
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :QUIRKY
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :HATEFUL
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LOVING
      case method
      when "walking"
        gain = [1, 1, 1][happiness_range]
      when "levelup"
        gain = [5, 4, 3][happiness_range]
      when "groom"
        gain = [10, 10, 4][happiness_range]
      when "evberry"
        gain = [10, 5, 2][happiness_range]
      when "vitamin"
        gain = [5, 3, 2][happiness_range]
      when "wing"
        gain = [3, 2, 1][happiness_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][happiness_range]
      when "faint"
        gain = [-20, -20, -30][happiness_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][happiness_range]
      when "powder"
        gain = [-15, -15, -10][happiness_range]
      when "energyroot"
        gain = [-10, -10, -15][happiness_range]
      when "revivalherb"
        gain = [-15, -15, -20][happiness_range]
      when "damaged"
        gain = [-5, -3, -2][happiness_range]
      when "neglected"
        gain = [-10, -10, -15][happiness_range]
      when "hungry"
        gain = [-10, -10, -15][happiness_range]
      when "thirsty"
        gain = [-10, -10, -15][happiness_range]
      when "tired"
        gain = [-10, -10, -15][happiness_range]
      when "youareeatingme"
        gain = [-255, -255, -255][happiness_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
	end
    if gain > 0
      gain += 1 if @obtain_map == $game_map.map_id
      gain += 1 if @poke_ball == :LUXURYBALL
      gain = (gain * 1.5).floor if hasItem?(:SOOTHEBELL)
    end
    @happiness = (@happiness + gain + base).clamp(0, 255)
  end

  
  # Changes the happiness of this Pokémon depending on what happened to change it.
  # @param method [String] the happiness changing method (e.g. 'walking')
  def changeLoyalty(method)
    gain = 0
     base = 0 if nature ==   :LOVING
     base = 0 if nature ==   :HATEFUL
     base = 30 if nature ==   :QUIRKY
     base = 0 if nature ==   :CAREFUL
     base = -5 if nature ==   :SASSY
     base = 0 if nature ==   :GENTLE
     base = 0 if nature ==   :CALM
     base = 50 if nature ==   :RASH
     base = 0 if nature ==   :BASHFUL
     base = 0 if nature ==   :QUIET
     base += 0 if nature ==   :MILD
     base += 0 if nature ==   :MODEST
     base += 0 if nature ==   :NAIVE
     base += 0 if nature ==   :JOLLY
     base += -10 if nature ==   :SERIOUS
     base += 75 if nature ==   :HASTY
     base += 0 if nature ==   :TIMID
     base += 0 if nature ==   :LAX
     base += 0 if nature ==   :IMPISH
     base += 0 if nature ==   :RELAXED
     base += 0 if nature ==   :DOCILE
     base += 75 if nature ==   :BOLD
     base += 5 if nature ==   :NAUGHTY
     base += 10 if nature ==   :ADAMANT
     base += 100 if nature ==   :BRAVE
     base += 0 if nature ==   :LONELY
     base += 70 if nature ==   :HARDY
    loyalty_range = @loyalty / 100
if nature ==   :HARDY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LONELY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BRAVE
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :ADAMANT
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :NAUGHTY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BOLD
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :DOCILE
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :RELAXED
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :IMPISH
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LAX
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :TIMID
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :HASTY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :SERIOUS
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :JOLLY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :NAIVE
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :MODEST
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :MILD
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :QUIET
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :BASHFUL
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :RASH
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :CALM
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :GENTLE
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :SASSY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :CAREFUL
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :QUIRKY
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :HATEFUL
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
elsif nature ==   :LOVING
      case method
      when "walking"
        gain = [1, 1, 1][loyalty_range]
      when "levelup"
        gain = [5, 4, 3][loyalty_range]
      when "groom"
        gain = [10, 10, 4][loyalty_range]
      when "evberry"
        gain = [10, 5, 2][loyalty_range]
      when "vitamin"
        gain = [5, 3, 2][loyalty_range]
      when "wing"
        gain = [3, 2, 1][loyalty_range]
      when "machine", "battleitem"
        gain = [1, 1, 0][loyalty_range]
      when "faint"
        gain = [-20, -20, -30][loyalty_range]
      when "faintbad"   # Fainted against an opponent that is 30+ levels higher
        gain = [-30, -40, -60][loyalty_range]
      when "powder"
        gain = [-15, -15, -10][loyalty_range]
      when "energyroot"
        gain = [-10, -10, -15][loyalty_range]
      when "revivalherb"
        gain = [-15, -15, -20][loyalty_range]
      when "damaged"
        gain = [-5, -3, -2][loyalty_range]
      when "neglected"
        gain = [-10, -10, -15][loyalty_range]
      when "hungry"
        gain = [-10, -10, -15][loyalty_range]
      when "thirsty"
        gain = [-10, -10, -15][loyalty_range]
      when "tired"
        gain = [-10, -10, -15][loyalty_range]
      when "youareeatingme"
        gain = [-255, -255, -255][loyalty_range]
      else
        raise _INTL("Unknown happiness-changing method: {1}", method.to_s)
    end
    @loyalty = (@loyalty + gain + base).clamp(0, 255)
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
      elsif battler.happiness >=0
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
    elsif target.damageState.happiness && target.happiness>=149 
      @battle.pbCommonAnimation("UseItem",target)
      @battle.pbDisplay(_INTL("{1} endured the hit for its trainer!",target.pbThis))
    end
  end
  end
  end
 