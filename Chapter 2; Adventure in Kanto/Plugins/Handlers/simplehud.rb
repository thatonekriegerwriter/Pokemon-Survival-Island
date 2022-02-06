#===============================================================================
# * Simple HUD Optimized - by FL (Credits will be apreciated)
#===============================================================================
#
# This script is for Pokémon Essentials. It displays a simple HUD with the
# party icons, HP Bars and some small text.
#
#===============================================================================
#
# To this script works, put it above main.
#
#===============================================================================
class Spriteset_Map
  class HUD
    # If you wish to use a background picture, put the image path below, like
    # BGPATH="Graphics/Pictures/battleMessage". I recommend a 512x64 picture
    BGPATH=""

    # Make as 'false' to don't show the blue bar
    USEBAR=false

    # Make as 'true' to draw the HUD at bottom
    DRAWATBOTTOM=false

    # Make as 'true' to only show HUD in the pause menu
    DRAWONLYINMENU=false

    # Make as 'false' to don't show the hp bars
    SHOWHPBARS=false

    # When above 0, only displays HUD when this switch is on.
    SWITCHNUMBER = 0

    # Lower this number = more lag.
    FRAMESPERUPDATE=0

    # The size of drawable content.
    BARHEIGHT = Graphics.height

    def initialize(viewport1)
      @viewport1 = viewport1
      @sprites = {}
      @yposition = DRAWATBOTTOM ? Graphics.height-96 : 0
    end

    def showHUD?
      return (
        $Trainer &&
        $PokemonSystem.survivalmode == 0 &&
        (!DRAWONLYINMENU || $game_temp.in_menu)
      )
    end

    def create
      @sprites.clear

      @partySpecies = Array.new(6, 0)
      @partyForm = Array.new(6, 0)
      @partyIsEgg = Array.new(6, false)
      @partyHP = Array.new(6, 0)
      @partyTotalHP = Array.new(6, 0)

      if USEBAR
        @sprites["bar"]=IconSprite.new(0,@yposition,@viewport1)
        barBitmap = Bitmap.new(Graphics.width,BARHEIGHT)
        barRect = Rect.new(0,0,barBitmap.width,barBitmap.height)
        barBitmap.fill_rect(barRect,Color.new(128,128,192))
        @sprites["bar"].bitmap = barBitmap
      end

      drawBarFromPath = BGPATH != ""
      if drawBarFromPath
        @sprites["bgbar"]=IconSprite.new(0,@yposition,@viewport1)
        @sprites["bgbar"].setBitmap(BGPATH)
      end

      @currentTexts = textsDefined
      drawText

      for i in 0...6
        x = 64+64*i
        y = @yposition+10
        y+=10 if SHOWHPBARS
        @sprites["pokeicon#{i}"]=IconSprite.new(x,y,@viewport1)
      end
      refreshPartyIcons

      if SHOWHPBARS
        borderWidth = 36
        borderHeight = 10
        fillWidth = 32
        fillHeight = 6
        for i in 0...6
          x=64*i+96
          y=@yposition+80

          @sprites["hpbarborder#{i}"] = BitmapSprite.new(
            borderWidth,borderHeight,@viewport1
          )
          @sprites["hpbarborder#{i}"].x = x-borderWidth/2
          @sprites["hpbarborder#{i}"].y = y-borderHeight/2
          @sprites["hpbarborder#{i}"].bitmap.fill_rect(
            Rect.new(0,0,borderWidth,borderHeight),
            Color.new(32,32,32)
          )
          @sprites["hpbarborder#{i}"].bitmap.fill_rect(
            (borderWidth-fillWidth)/2,
            (borderHeight-fillHeight)/2,
            fillWidth,
            fillHeight,
            Color.new(96,96,96)
          )
          @sprites["hpbarborder#{i}"].visible = false

          @sprites["hpbarfill#{i}"] = BitmapSprite.new(
            fillWidth,fillHeight,@viewport1
          )
          @sprites["hpbarfill#{i}"].x = x-fillWidth/2
          @sprites["hpbarfill#{i}"].y = y-fillHeight/2
        end
        refreshHPBars
      end

      for sprite in @sprites.values
        sprite.z+=600
      end
    end


    def drawText
	
    if $game_variables[225] >= 80
         trainerhealth = _INTL("Healthy")
         healthColor=Color.new(255,255,255)
     else
       if $game_variables[225] >= 50
         trainerhealth = _INTL("Injured")
         healthColor=Color.new(255,255,255)
     else
        if $game_variables[225] >= 25
         trainerhealth = _INTL("Wounded")
         healthColor=Color.new(255,255,255)
     else
        if $game_variables[225] <= 24
         trainerhealth = _INTL("Critical")
         healthColor=Color.new(255,255,255)
        end
        end
     end
    end

    if $game_variables[205] >= 80
         trainerhunger = _INTL("Full")
         hungerColor=Color.new(55,255,55)
       else
         if $game_variables[205] >= 75
           trainerhunger = _INTL("Well Off")
           hungerColor=Color.new(255,255,55)
         else
           if $game_variables[205] >= 50
             trainerhunger = _INTL("Hungry")
             hungerColor=Color.new(255,125,55)
           else
               if $game_variables[205] >= 25
                trainerhunger = _INTL("Starving")
                hungerColor=Color.new(255,125,55)
                else
                 if $game_variables[205] <= 24
                   trainerhunger= _INTL("Dying")
                   hungerColor=Color.new(255,55,55)
			    end
			   end
           end
         end
       end   


    if $game_variables[206] >= 80
         trainerthirst = _INTL("Quenched")
         thirstColor=Color.new(55,255,55)
       else
         if $game_variables[206] >= 75
           trainerthirst = _INTL("Well Off")
           thirstColor=Color.new(255,255,55)
         else
           if $game_variables[206] >= 50
             trainerthirst = _INTL("Thirsty")
             thirstColor=Color.new(255,125,55)
           else
               if $game_variables[206] >= 25
                trainerthirst = _INTL("Dehydrated")
                thirstColor=Color.new(255,125,55)
                else
                 if $game_variables[206] <= 24
                   trainerthirst= _INTL("Dying")
                   thirstColor=Color.new(255,55,55)
			    end
			   end
           end
         end
       end   

    if $game_variables[208] >= 80
          trainersleep = _INTL("Rested")
          sleepColor=Color.new(55,255,55)
       else
         if $game_variables[208] >= 75
            trainersleep = _INTL("Well Off")
            sleepColor=Color.new(255,255,55)
         else
           if $game_variables[208] >= 50
              trainersleep = _INTL("Tired")
              sleepColor=Color.new(255,125,55)
           else
               if $game_variables[208] >= 25
                 trainersleep = _INTL("Deprived")
                 sleepColor=Color.new(255,125,55)
                else
                 if $game_variables[208] <= 24
                   trainersleep= _INTL("Dying")
                   sleepColor=Color.new(255,55,55)
			    end
			   end
           end
         end
       end 
      shadowColor=Color.new(160,160,160)

      if @sprites.include?("overlay")
        @sprites["overlay"].bitmap.clear
      else
        width = Graphics.width
        @sprites["overlay"] = BitmapSprite.new(width,BARHEIGHT,@viewport1)
        @sprites["overlay"].y = @yposition
      end

      xposition = Graphics.width-64
      textPositions=[
        [@currentTexts[0],50,0,2,healthColor,shadowColor],
        [@currentTexts[1],20,300,2,hungerColor,shadowColor],
        [@currentTexts[2],20,325,2,thirstColor,shadowColor],
        [@currentTexts[3],20,350,2,sleepColor,shadowColor]
      ]

      pbSetSystemFont(@sprites["overlay"].bitmap)
      pbDrawTextPositions(@sprites["overlay"].bitmap,textPositions)
    end

    # Note that this method is called on each refresh, but the texts
    # only will be redrawed if any character change.
    def textsDefined
      ret=[]
      ret[0] = _INTL("HP: {1}/100",$game_variables[225])
      ret[1] = _INTL("FOD",$game_variables[205])
      ret[2] = _INTL("H20",$game_variables[206])
      ret[3] = _INTL("SLP",$game_variables[208])
      return ret
    end

    def refreshPartyIcons
      for i in 0...6
        partyMemberExists = $Trainer.party.size > 7
        partySpecie = 0
        partyForm = 0
        partyIsEgg = false
        if partyMemberExists
          partySpecie = $Trainer.party[i].species
          partyForm = $Trainer.party[i].form
          partyIsEgg = $Trainer.party[i].egg?
        end
        refresh = (
          @partySpecies[i]!=partySpecie || 
          @partyForm[i]!=partyForm ||
          @partyIsEgg[i]!=partyIsEgg
        )
        if refresh
          @partySpecies[i] = partySpecie
          @partyForm[i] = partyForm
          @partyIsEgg[i] = partyIsEgg
          if partyMemberExists
            pokemonIconFile = GameData::Species.icon_filename_from_pokemon(
              $Trainer.party[i]
            )
            @sprites["pokeicon#{i}"].setBitmap(pokemonIconFile)
            @sprites["pokeicon#{i}"].src_rect=Rect.new(0,0,64,64)
          end
          @sprites["pokeicon#{i}"].visible = partyMemberExists
        end
      end
    end

    def refreshHPBars
      for i in 0...6
        hp = 0
        totalhp = 0
        hasHP = i<$Trainer.party.size && !$Trainer.party[i].egg?
        if hasHP
          hp = $Trainer.party[i].hp
          totalhp = $Trainer.party[i].totalhp
        end

        lastTimeWasHP = @partyTotalHP[i] != 0
        @sprites["hpbarborder#{i}"].visible = hasHP if lastTimeWasHP != hasHP

        redrawFill = hp != @partyHP[i] || totalhp != @partyTotalHP[i]
        if redrawFill
          @partyHP[i] = hp
          @partyTotalHP[i] = totalhp
          @sprites["hpbarfill#{i}"].bitmap.clear

          width = @sprites["hpbarfill#{i}"].bitmap.width
          height = @sprites["hpbarfill#{i}"].bitmap.height
          fillAmount = (hp==0 || totalhp==0) ? 0 : hp*width/totalhp
          # Always show a bit of HP when alive
          fillAmount = 1 if fillAmount==0 && hp>0
          if fillAmount > 0
            hpColors=nil
            if hp<=(totalhp/4).floor
              hpColors = [Color.new(240,80,32),Color.new(168,48,56)] # Red
            elsif hp<=(totalhp/2).floor
              hpColors = [Color.new(248,184,0),Color.new(184,112,0)] # Orange
            else
              hpColors = [Color.new(24,192,32),Color.new(0,144,0)] # Green
            end
            shadowHeight = 2
            rect = Rect.new(0,0,fillAmount,shadowHeight)
            @sprites["hpbarfill#{i}"].bitmap.fill_rect(rect, hpColors[1])
            rect = Rect.new(0,shadowHeight,fillAmount,height-shadowHeight)
            @sprites["hpbarfill#{i}"].bitmap.fill_rect(rect, hpColors[0])
          end
        end
      end
    end

    def update
      if showHUD?
        if @sprites.empty?
          create
        else
          updateHUDContent = (
            FRAMESPERUPDATE<=1 || Graphics.frame_count%FRAMESPERUPDATE==0
          )
          if updateHUDContent
            newTexts = textsDefined
            if @currentTexts != newTexts
              @currentTexts = newTexts
              drawText
            end
            refreshPartyIcons
            refreshHPBars if SHOWHPBARS
          end
        end
        pbUpdateSpriteHash(@sprites)
      else
        dispose if !@sprites.empty?
      end
    end

    def dispose
      pbDisposeSpriteHash(@sprites)
    end
  end


  
  alias :initializeOldFL :initialize
  alias :disposeOldFL :dispose
  alias :updateOldFL :update

  def initialize(map=nil)
    initializeOldFL(map)
  end

  def dispose
    @hud.dispose if @hud
    disposeOldFL
  end

  def update
    updateOldFL
    @hud = HUD.new(@viewport1) if !@hud
    @hud.update
  end
end



# For compatibility with older versions
module GameData
  class Species
    class << self
      if !method_defined?(:icon_filename_from_pokemon)
        def icon_filename_from_pokemon(pkmn)
          pbPokemonIconFile(pkmn)
        end
      end
    end
  end
end