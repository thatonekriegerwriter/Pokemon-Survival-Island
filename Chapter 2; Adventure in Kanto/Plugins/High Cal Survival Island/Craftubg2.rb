################################################################################
# Item Crafter
# By Phantombass
# Designed to simplify the Item Crafter Events
# This is merely an example of how this script works as far as items go. Make your
# own item combinations and add them in their respective sections of this script.
# Then to call in an event, simply add a Script command that says:
#
# pbItemcraft(PBItems::item), where item is the internal name of the item.
################################################################################
################################################################################
PluginManager.register({
  :name => "Item Crafter",
  :version => "1.0",
  :credits => "Phantombass",
  :link => "No link yet"
})

module Items
  #These are all the variables associated with the Items we will be crafting,
  #in order to make the variable reference process easier. These are only needed
  #if you plan to make a page after the script is run that gives another bit of dialogue
  #without running script again and you don't want to use a Self Switch.

  Wingsuit = 79
  Hammer = 80
  Torch = 81
  Chainsaw = 82
  Hovercraft = 83
  ScubaTank = 84
  AquaRocket = 85
  Fulcrum = 86
  HikingGear = 88
end

def canItemCraft?(item)
  itemName = GameData::Item.get(item).name
  return false if hasConst?(GameData::Item,item) && $PokemonBag.pbHasItem?(item)
  case itemName
  when "KC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:KELPSYCURRY) && $PokemonBag.pbHasItem?(:PETAYABERRY)
  when "WC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:WATMELBERRY) && $PokemonBag.pbHasItem?(:SALACBERRY)
  when "DC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:DURINBERRY) && $PokemonBag.pbHasItem?(:APICOTBERRY)
  when "MC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:MICLEBERRY) && $PokemonBag.pbHasItem?(:PAMTREBERRY)
  when "BC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:BELUEBERRY) && $PokemonBag.pbHasItem?(:HONDEWBERRY)
  when "LC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:LANSATBERRY) && $PokemonBag.pbHasItem?(:RAZZBERRY)
  when "STC"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:STARFBERRY) && $PokemonBag.pbHasItem?(:NANABBERRY)
  when "ATKCURRY"
    return true if $PokemonBag.pbHasItem?(:BOWL) && $PokemonBag.pbHasItem?(:SPELONBERRY) && $PokemonBag.pbHasItem?(:LIECHIBERRY)
  when "Sweetheart"
    return true if $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:COCOABEANS)
  when "Tea"
    return true if $PokemonBag.pbHasItem?(:FRESHWATER) && $PokemonBag.pbHasItem?(:TEALEAF)
  when "Bread"
    return true if $PokemonBag.pbQuantity(:WHEAT>=3)
  when "CarrotCake"
    return true if $PokemonBag.pbHasItem?(:CARROT) && $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:MOOMOOMILK)
  when "Lemonade"
    return true if $PokemonBag.pbHasItem?(:LEMON) && $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:WATERBOTTLE)
  when "CalmMint"
    return true if $PokemonBag.pbHasItem?(:APICOTBERRY) && $PokemonBag.pbHasItem?(:SUGAR)
  when "CASTELIACONE"
    return true if $PokemonBag.pbHasItem?(:NEVERMELTICE) && $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:MOOMOOMILK)
  when "RageCandyBar"
    return true if $PokemonBag.pbHasItem?(:CHOCOLATE) && $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:MOOMOOMILK)
  when "SodaPop"
    return true if $PokemonBag.pbHasItem?(:FRESHWATER) && $PokemonBag.pbHasItem?(:SUGAR) && $PokemonBag.pbHasItem?(:CHESTOBERRY)
  end
end

def pbItemcraft(item)
  itemName = GameData::Item.get(item).name
  if !canItemCraft?(item)
    if $PokemonBag.pbHasItem?(item)
      pbMessage(_INTL("You already have a {1}! You do not need another!",itemName))
    else
      pbMessage(_INTL("It appears you do not have the required items to craft the {1} yet.",itemName))
    end
  end
  if canItemCraft?(item)
  case itemName
  when "KC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:KELPSYCURRY,1)
    $PokemonBag.pbDeleteItem(:PETAYABERRY,1)
    Kernel.pbReceiveItem(:SATKCURRY)
  when "WC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:WATMELBERRY,1)
    $PokemonBag.pbDeleteItem(:SALACBERRY,1)
    Kernel.pbReceiveItem(:SPEEDCURRY)
  when "DC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:DURINBERRY,1)
    $PokemonBag.pbDeleteItem(:APICOTBERRY,1)
    Kernel.pbReceiveItem(:SPDEFCURRY)
  when "MC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:MICLEBERRY,1)
    $PokemonBag.pbDeleteItem(:PAMTREBERRY,1)
    Kernel.pbReceiveItem(:ACCCURRY)
  when "BC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:BELUEBERRY,1)
    $PokemonBag.pbDeleteItem(:HONDEWBERRY,1)
    Kernel.pbReceiveItem(:DEFCURRY)
  when "LC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:LANSATBERRY,1)
    $PokemonBag.pbDeleteItem(:RAZZBERRY,1)
    Kernel.pbReceiveItem(:CRITCURRY)
  when "STC"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:STARFBERRY,1)
    $PokemonBag.pbDeleteItem(:NANABBERRY,1)
    Kernel.pbReceiveItem(:GSCURRY)
  when "ATKCURRY"
    $PokemonBag.pbDeleteItem(:BOWL,1)
    $PokemonBag.pbDeleteItem(:SPELONBERRY,1)
    $PokemonBag.pbDeleteItem(:LIECHIBERRY,1)
    Kernel.pbReceiveItem(:ATKCURRY)
  when "Sweetheart"
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:COCOABEANS,1)
    Kernel.pbReceiveItem(:SWEETHEART)
  when "Bread"
    $PokemonBag.pbDeleteItem(:WHEAT,3)
    Kernel.pbReceiveItem(:BREAD)
  when "Tea"
    $PokemonBag.pbDeleteItem(:FRESHWATER,1)
    $PokemonBag.pbDeleteItem(:TEALEAF,1)
    Kernel.pbReceiveItem(:TEA)
  when "CarrotCake"
    $PokemonBag.pbDeleteItem(:CARROT,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:MOOMOOMILK,1)
    Kernel.pbReceiveItem(:CARROTCAKE)
  when "Lemonade"
    $PokemonBag.pbDeleteItem(:LEMON,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:WATERBOTTLE,1)
    Kernel.pbReceiveItem(:LEMONADE)
  when "CalmMint"
    $PokemonBag.pbDeleteItem(:APICOTBERRY,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    Kernel.pbReceiveItem(:CALMMINT)
  when "CASTELIACONE"
    $PokemonBag.pbDeleteItem(:NEVERMELTICE,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:MOOMOOMILK,1)
    Kernel.pbReceiveItem(:CASTELIACONE)
  when "RageCandyBar"
    $PokemonBag.pbDeleteItem(:CHOCOLATE,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:MOOMOOMILK,1)
    Kernel.pbReceiveItem(:RAGECANDYBAR)
  when "SodaPop"
    $PokemonBag.pbDeleteItem(:FRESHWATER,1)
    $PokemonBag.pbDeleteItem(:SUGAR,1)
    $PokemonBag.pbDeleteItem(:CHESTOBERRY,1)
    Kernel.pbReceiveItem(:SODAPOP)
  end
end
end