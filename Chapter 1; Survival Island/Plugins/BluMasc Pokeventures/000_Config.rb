#-------------------------------------------------------------------------------
# Adventure: code for sending pokemon adventuring
#-------------------------------------------------------------------------------
module PokeventureConfig
  Updatesteps = 25 # How many steps should be taken before the Adventure progresses
  CustomMusic = "Mystery Dungeon Guild" # Custom music to play in the menue. Must be in the BGM folder
  #Item Collection
  CollectRandomItem = true #Collect Items from the Table below
  CollectItemsFromBattles = true # Collect Items from defeated Pokemon
  Items = {
    :common => [:POKETOY, :POKEBALL, :FRESHWATER, :REPEL, :HEARTSCALE],
    :uncommon => [:THUNDERSTONE, :WATERSTONE, :LEAFSTONE, :MOONSTONE, :FIRESTONE,
                  :SUNSTONE, :SHINYSTONE, :DUSKSTONE, :DAWNSTONE,
				  :EVERSTONE, :OVALSTONE],
	:rare => [:LEMONADE, :ENERGYROOT, :PEARL, :BIGPEARL, :SUPERREPEL],  
    :ultrarare => [:MASTERBALL, :PEARLSTRING],
  }
  ChanceToGetEnemyItem = 5 # as a 1 in x chance
  # Friends
  FindFriends = true # If there is Space should there be a chance for wild pokèmon to join you.
  ChanceToFindFriend = 1 # as a 1 in x chance
  AreFoundFriendsBrilliant = true #have higher ivs and a higher shiny chance
  # Exp
  GainExp = true # should the pokemon gain exp through adventuring
  # Wild Pokemon
  GlobalPkmn = false # should this script use the global encounter list everywhere instead of the specific map encounters.
  PkmnList = [:PIKACHU,:CHARMANDER,:SQUIRTLE,:BULBASAUR,:EEVEE]
  GlobalLeveling = true # makes the level of the encounters balanced around the number of badges instead of the location (always on if globalPkmn is on)
  #level per badge [min,max] can add more if you have more badges in your game
  PkmnLevel = [
	[2,15],		#0 Badges
	[11,25],	#1 Badge
	[21,35],	#2 Badges...
	[31,40],
	[41,50],
	[51,60],
	[61,70],
	[71,80],
	[81,90]		#8Badges
  ]
  # Trigering Abilities
  # Enter all the functions of Abilities that should be triggered after battle here (like Pickup and Honeygather )
  def self.pbAdventureAbilities(pkmn)
	pbPickup(pkmn)
	pbHoneyGather(pkmn)
  end
end

#-------------------------------------------------------------------------------
# EncounterTypes
#-------------------------------------------------------------------------------
GameData::EncounterType.register({
  :id => :Adventure,
  :type => :none,
  :trigger_chance => 1,
  :old_slots => [50, 20, 10, 5, 5, 5, 5],
})

SaveData.register(:adventure_party) do
  ensure_class :Adventure 
  save_value { $Adventure  }
  load_value { |value| $Adventure = value }
  new_game_value {
    Adventure.new
  }
end

Events.onStepTaken += proc { |_sender,_e|
  $Adventure.newStep
}

