class Pokemon

  # @return [Integer] this Pokémon's current loyalty (an integer between 0 and 255)
  attr_accessor :loyalty
  
  
  
  # Changes the happiness of this Pokémon depending on what happened to change it.
  # @param method [String] the happiness changing method (e.g. 'walking')
  def changeLoyalty(method)
    gain = 0
    loyalty_range = @loyalty / 100
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
      raise _INTL("Unknown loyalty-changing method: {1}", method.to_s)
    end
 #   if gain > 0
 #    gain += 1 if @obtain_map == $game_map.map_id
 #     gain += 1 if @poke_ball == :LUXURYBALL
 #     gain = (gain * 1.5).floor if hasItem?(:SOOTHEBELL)
 #   end
    @loyalty = (@loyalty + gain).clamp(0, 255)
  end
end

class PokeBattle_Battler

def loyalty; return @pokemon ? @pokemon.loyalty : 0;    end

end

module Gamedata
  class Species    
    attr_reader :loyalty
	
	
    def self.schema(compiling_forms = false)
      ret = {
        "Loyalty"         => [0, "u"],
      }

      return ret
    end
	

    def initialize(hash)
      @loyalty               = hash[:loyalty]             || 0
    end
end

  class Trainer
  
    SCHEMA = {
      "Loyalty"    => [:loyalty,     "u"],
    }
end
end
