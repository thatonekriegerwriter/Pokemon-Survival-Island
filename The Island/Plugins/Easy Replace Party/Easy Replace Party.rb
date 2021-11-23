module PokeBattle_BattleCommon
  def pbStorePokemon(pkmn)
    if !pkmn.shadowPokemon?
      if pbDisplayConfirm(_INTL("Would you like to give a nickname to {1}?",pkmn.name))
        nickname=@scene.pbNameEntry(_INTL("{1}'s nickname?",pkmn.speciesName),pkmn)
        pkmn.name=nickname
      end
    end
    if $Trainer.party.length<6
      $Trainer.party[$Trainer.party.length]=pkmn
      return
    else
      new_poke = -1
if pbDisplayConfirm(_INTL("Would you like to keep {1} in your party?",pkmn.name))
  pbDisplayPaused(_INTL("Please select a Pokémon to swap from your party."))
  pbChoosePokemon(1,2)
  idxParty = pbGet(1)
  if idxParty >= 0
    new_poke = pkmn
    pkmn = $Trainer.party[idxParty].clone
    $Trainer.party[idxParty] = new_poke
    @initialItems[0][idxParty] = new_poke.item_id if @initialItems
  end
end
      
      oldcurbox=@peer.pbCurrentBox()
      storedbox=@peer.pbStorePokemon(pbPlayer,pkmn)
      creator=@peer.pbGetStorageCreatorName
      return if storedbox<0
      curboxname=@peer.pbBoxName(oldcurbox)
      boxname=@peer.pbBoxName(storedbox)
      
      if storedbox!=oldcurbox
        if creator
          pbDisplayPaused(_INTL("Box \"{1}\" on {2}'s PC was full.",curboxname,creator))
        else
          pbDisplayPaused(_INTL("Box \"{1}\" on someone's PC was full.",curboxname))
        end
        pbDisplayPaused(_INTL("{1} was transferred to box \"{2}\".",pkmn.name,boxname))
      else
        if creator
          pbDisplayPaused(_INTL("{1} was transferred to {2}'s PC.",pkmn.name,creator))
        else
          pbDisplayPaused(_INTL("{1} was transferred to someone's PC.",pkmn.name))
        end
        pbDisplayPaused(_INTL("It was stored in box \"{1}\".",boxname))
      end
      if new_poke != -1
        pbDisplayPaused(_INTL("{2} has been added to {1}'s party!",$Trainer.name,new_poke.name))
      end
    end
  end
end

def pbStorePokemon(pkmn)
  if pbBoxesFull?
    pbMessage(_INTL("There's no more room for Pokémon!\1"))
    pbMessage(_INTL("The Pokémon Boxes are full and can't accept any more!"))
    return
  end
  pkmn.record_first_moves
  if $Trainer.party.length<6
    $Trainer.party[$Trainer.party.length] = pkmn
  else
    new_poke = -1
if pbConfirmMessage(_INTL("Would you like to keep {1} in your party?",pkmn.name))
  pbMessage(_INTL("Please select a Pokémon to swap from your party."))
  pbChoosePokemon(1,2)
  idxParty = pbGet(1)
  if idxParty >= 0
    new_poke = pkmn
    pkmn = $Trainer.party[idxParty].clone
    $Trainer.party[idxParty] = new_poke
    @initialItems[0][idxParty] = new_poke.item_id if @initialItems
  end
end
    oldcurbox = $PokemonStorage.currentBox
    storedbox = $PokemonStorage.pbStoreCaught(pkmn)
    curboxname = $PokemonStorage[oldcurbox].name
    boxname = $PokemonStorage[storedbox].name
    creator = nil
    creator = pbGetStorageCreator if $Trainer.seen_storage_creator
    if storedbox!=oldcurbox
      if creator
      pbMessage(_INTL("Box \"{1}\" on {2}'s PC was full.\1",curboxname,creator))
      else
      pbMessage(_INTL("Box \"{1}\" on someone's PC was full.\1",curboxname))
      end
      pbMessage(_INTL("{1} was transferred to box \"{2}.\"",pkmn.name,boxname))
    else
      if creator
        pbMessage(_INTL("{1} was transferred to {2}'s PC.\1",pkmn.name,creator))
      else
      pbMessage(_INTL("{1} was transferred to someone's PC.\1",pkmn.name))
      end
      pbMessage(_INTL("It was stored in box \"{1}.\"",boxname))
    end
    if new_poke != -1
      pbMessage(_INTL("\\me[Pkmn get]{2} has been added to {1}'s party!",$Trainer.name,new_poke.name))
    end
  end
end