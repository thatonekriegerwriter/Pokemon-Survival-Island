###---craftS
class Crafts_Scene
#################################
## Configuration
  craftNAMEBASECOLOR=Color.new(88,88,80)
  craftNAMESHADOWCOLOR=Color.new(168,184,184)
#################################
  
  def update
    pbUpdateSpriteHash(@sprites)
  end

  def pbPrepareWindow(window)
    window.visible=true
    window.letterbyletter=false
  end
  
  def pbStartScene(selection)
    @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z=99999
    @selection=0
    @quant=1
    @currentArray=0
    @returnItem=:NO
    @itemA=:NO
    @itemB=:NO
    @itemC=:NO
    @sprites={}
    @icons={}
    @required=[]
    @sprites["background"]=IconSprite.new(0,0,@viewport)
    @sprites["background"].setBitmap("Graphics/Pictures/craftingPage")
    @sprites["overlay"]=BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    coord=0
    @imagepos=[]
    @selectX=100
    @selectY=168
    @sprites["quant"]=Window_UnformattedTextPokemon.new("")
    @sprites["quantA"]=Window_UnformattedTextPokemon.new("")
    @sprites["quantB"]=Window_UnformattedTextPokemon.new("")
    @sprites["quantC"]=Window_UnformattedTextPokemon.new("")
    @sprites["craftA"]=Window_UnformattedTextPokemon.new("")
    @sprites["craftB"]=Window_UnformattedTextPokemon.new("")
    @sprites["craftC"]=Window_UnformattedTextPokemon.new("")
    @sprites["craftResult"]=Window_UnformattedTextPokemon.new("")
    pbPrepareWindow(@sprites["quant"])
    @sprites["quant"].x=356
    @sprites["quant"].y=224
    @sprites["quant"].width=Graphics.width-48
    @sprites["quant"].height=Graphics.height
    @sprites["quant"].baseColor=Color.new(240,240,240)
    @sprites["quant"].shadowColor=Color.new(40,40,40)
    @sprites["quant"].visible=true
    @sprites["quant"].viewport=@viewport
    @sprites["quant"].windowskin=nil
    pbPrepareWindow(@sprites["quantA"])
    @sprites["quantA"].x=112
    @sprites["quantA"].y=224
    @sprites["quantA"].width=Graphics.width-48
    @sprites["quantA"].height=Graphics.height
    @sprites["quantA"].baseColor=Color.new(160,160,160)
    @sprites["quantA"].shadowColor=Color.new(40,40,40)
    @sprites["quantA"].visible=true
    @sprites["quantA"].viewport=@viewport
    @sprites["quantA"].windowskin=nil
    pbPrepareWindow(@sprites["quantB"])
    @sprites["quantB"].x=172
    @sprites["quantB"].y=224
    @sprites["quantB"].width=Graphics.width-48
    @sprites["quantB"].height=Graphics.height
    @sprites["quantB"].baseColor=Color.new(160,160,160)
    @sprites["quantB"].shadowColor=Color.new(40,40,40)
    @sprites["quantB"].visible=true
    @sprites["quantB"].viewport=@viewport
    @sprites["quantB"].windowskin=nil
    pbPrepareWindow(@sprites["quantC"])
    @sprites["quantC"].x=236
    @sprites["quantC"].y=224
    @sprites["quantC"].width=Graphics.width-48
    @sprites["quantC"].height=Graphics.height
    @sprites["quantC"].baseColor=Color.new(160,160,160)
    @sprites["quantC"].shadowColor=Color.new(40,40,40)
    @sprites["quantC"].visible=true
    @sprites["quantC"].viewport=@viewport
    @sprites["quantC"].windowskin=nil
    pbPrepareWindow(@sprites["craftResult"])
    @sprites["craftResult"].x=30
    @sprites["craftResult"].y=294
    @sprites["craftResult"].width=Graphics.width-48
    @sprites["craftResult"].height=Graphics.height
    @sprites["craftResult"].baseColor=Color.new(0,0,0)
    @sprites["craftResult"].shadowColor=Color.new(160,160,160)
    @sprites["craftResult"].visible=true
    @sprites["craftResult"].viewport=@viewport
    @sprites["craftResult"].windowskin=nil
    @sprites["selector"]=IconSprite.new(@selectX,@selectY,@viewport)
    @sprites["selector"].setBitmap("Graphics/Pictures/craftSelect")
    
    filenamA=GameData::Item.icon_filename(@itemA)
    @icons["itemA"]=IconSprite.new(100,168,@viewport)
    @icons["itemA"].setBitmap(filenamA)
    
    filenamB=GameData::Item.icon_filename(@itemB)
    @icons["itemB"]=IconSprite.new(164,168,@viewport)
    @icons["itemB"].setBitmap(filenamB)
    
    filenamC=GameData::Item.icon_filename(@itemC)
    @icons["itemC"]=IconSprite.new(228,168,@viewport)
    @icons["itemC"].setBitmap(filenamC)
    
    filenamD=GameData::Item.icon_filename(@returnItem)
    @icons["itemResult"]=IconSprite.new(356,168,@viewport)
    @icons["itemResult"].setBitmap(filenamD)
    
    pbDeactivateWindows(@sprites)
    pbRefresh
    pbFadeInAndShow(@sprites)
  end

  def pbEndScene
    pbFadeOutAndHide(@icons)
    pbDisposeSpriteHash(@icons)

    pbFadeOutAndHide(@sprites)
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end


  def pbRefresh
    #@sprites["background"].setBitmap(sprintf("Graphics/Pictures/charselect#{playerCharacter}"))
  end

# Script that manages button inputs  
  def pbSelectcraft
    overlay=@sprites["overlay"].bitmap
    overlay.clear
    pbSetSystemFont(overlay)
    pbDrawImagePositions(overlay,@imagepos)
    @returnItem=:NO
    @itemA=:NO
    @itemB=:NO
    @itemC=:NO
    @quantA=0
    @quantB=0
    @quantC=0
    while true
    Graphics.update
      Input.update
      self.update
      @sprites["selector"].x=@selectX
      @sprites["selector"].y=@selectY
      
      filenamA = GameData::Item.icon_filename(@itemA)
      @icons["itemA"].setBitmap(filenamA)
      
      filenamB = GameData::Item.icon_filename(@itemB)
      @icons["itemB"].setBitmap(filenamB)
      
      filenamC = GameData::Item.icon_filename(@itemC)
      @icons["itemC"].setBitmap(filenamC)
      
      filenamD = GameData::Item.icon_filename(@returnItem)
      @icons["itemResult"].setBitmap(filenamD)
      
      selectionNum=@selection
      if @currentArray!=0
        @craftA=GameData::Item.get(CraftsList.getcrafts[@currentArray][1]).name
        @craftB=GameData::Item.get(CraftsList.getcrafts[@currentArray][2]).name
        @craftC=GameData::Item.get(CraftsList.getcrafts[@currentArray][3]).name
        @craftResult=GameData::Item.get(CraftsList.getcrafts[@currentArray][0]).name
      else
        @craftA=:NO
        @craftB=:NO
        @craftC=:NO
        @craftResult=:NO
      end
      @sprites["quant"].text=_INTL("{1}",@quant)
      @sprites["quantA"].text=_INTL("{1}",@quantA)
      @sprites["quantB"].text=_INTL("{1}",@quantB)
      @sprites["quantC"].text=_INTL("{1}",@quantC)
      if @craftA==:NO
        @sprites["craftResult"].text=_INTL("No items selected.")
      elsif @craftA!=:NO && @craftResult==:NO
        @sprites["craftResult"].text=_INTL("Incorrect crafting recipe.")
      elsif CraftsList.getcrafts[@currentArray][2]==:NO
        @sprites["craftResult"].text=_INTL("{1} = {2}",@craftA,@craftResult)
      elsif CraftsList.getcrafts[@currentArray][3]==:NO
        @sprites["craftResult"].text=_INTL("{1} + {2} = {3}",@craftA,@craftB,@craftResult)
      else
        @sprites["craftResult"].text=_INTL("{1} + {2} + {3} = {4}",@craftA,@craftB,@craftC,@craftResult)
      end
      if Input.trigger?(Input::LEFT)
        if @selection==0
          @selectX=356
          @selection+=3
        elsif @selection==3
          @selectX=228
          @selection=2
        else
          @selectX-=64
          @selection-=1
        end
      elsif Input.trigger?(Input::RIGHT)
        if @selection==3
          @selectX=100
          @selection-=3
        elsif @selection==2
          @selectX=356
          @selection=3
        else
          @selectX+=64
          @selection+=1
        end
      end
      if Input.trigger?(Input::UP)
        if @quant>99
          @quant=1
        else
          @quant+=1
        end
      end
      if Input.trigger?(Input::DOWN)
        if @quant==1
          @quant=100
        else
          @quant-=1
        end
      end
      if Input.trigger?(Input::C)
        if @selection==3 && @returnItem!=:NO
          if CraftsList.getcrafts[@currentArray][2]==:NO #If slot 2 is empty, don't read it
            if $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][1])>=@quant
              #if CraftsList.getcrafts[@currentArray][1]==@itemA
                @recipe=[@returnItem,@itemA,:NO,:NO]
                if pbCheckRecipe(@recipe)
                  Kernel.pbReceiveItem(@returnItem,@quant)
                  $PokemonBag.pbDeleteItem(@itemA,@quant)
                  @itemA=:NO
                  @returnItem=:NO
                  @quant=1
                  @quantA=0
                  @quantB=0
                  @quantC=0
                end
              #end
            else
              Kernel.pbMessage(_INTL("You don't have the ingredients to craft this many items!"))
            end
          elsif CraftsList.getcrafts[@currentArray][3]==:NO&&CraftsList.getcrafts[@currentArray][2]!=:NO
            if $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][1])>=@quant &&
              $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][2])>=@quant
                Kernel.pbReceiveItem(@returnItem,@quant)
                $PokemonBag.pbDeleteItem(@itemA,@quant)
                $PokemonBag.pbDeleteItem(@itemB,@quant)
                @itemA=:NO
                @itemB=:NO
                @returnItem=:NO
                @quant=1
                @quantA=0
                @quantB=0
                @quantC=0
            else
              Kernel.pbMessage(_INTL("You don't have the ingredients to craft this many items!"))
            end
          else
            if $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][1])>=@quant &&
            $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][2])>=@quant &&
            $PokemonBag.pbQuantity(CraftsList.getcrafts[@currentArray][3])>=@quant
              Kernel.pbReceiveItem(@returnItem,@quant)
              $PokemonBag.pbDeleteItem(@itemA,@quant)
              $PokemonBag.pbDeleteItem(@itemB,@quant)
              $PokemonBag.pbDeleteItem(@itemC,@quant)
              @itemA=:NO
              @itemB=:NO
              @itemC=:NO
              @returnItem=:NO
              @quant=1
              @quantA=0
              @quantB=0
              @quantC=0
            else
              Kernel.pbMessage(_INTL("You don't have the ingredients to craft this many items!"))
            end
          end
        elsif @selection==0
          @returnItem=:NO
          @itemA=Kernel.pbChooseItem
		  crafts = CraftsList.getcrafts
		  pbMessage(_INTL("Starting to fill item"))
          for i in 0..45
            if crafts[i][1]==@itemA &&
            crafts[i][2]==@itemB &&
            crafts[i][3]==@itemC
              @currentArray=i
              @returnItem=crafts[i][0]
              @required[1]=crafts[i][1]
            end
            if crafts[i][2]!=@itemB && @itemB==:NO
              @itemB=:NO
              @quantB=0
            end
            if crafts[i][3]!=@itemC && @itemC==:NO
              @quantC=0
            end
		  end
          
        elsif @selection==1
          @returnItem=:NO
          @itemB=Kernel.pbChooseItem
          for i in 0..45
            if CraftsList.getcrafts[i][1]==@itemA &&
            CraftsList.getcrafts[i][2]==@itemB &&
            CraftsList.getcrafts[i][3]==@itemC
     		  pbMessage(_INTL("If ABC2 succeeded!"))
     		  pbMessage(_INTL("A = {1}, B = {2}, C = {3}",@itemA,@itemB,@itemC))
              @currentArray=i
              @returnItem=CraftsList.getcrafts[i][0]
              @required[2]=CraftsList.getcrafts[i][2]
            end
            if CraftsList.getcrafts[i][2]!=@itemA && @itemA==:NO
              @itemA=:NO
              @quantA=0
            end
            if CraftsList.getcrafts[i][2]!=@itemC && @itemC==:NO
              @itemC=:NO
              @quantC=0
            end
          end

        elsif @selection==2
          @returnItem=:NO
          @itemC=Kernel.pbChooseItem
          for i in 0..45
            if CraftsList.getcrafts[i][1]==@itemA &&
            CraftsList.getcrafts[i][2]==@itemB &&
            CraftsList.getcrafts[i][3]==@itemC
     		  pbMessage(_INTL("If ABC3 succeeded!"))
     		  pbMessage(_INTL("A = {1}, B = {2}, C = {3}",@itemA,@itemB,@itemC))
              @currentArray=i
              @returnItem=CraftsList.getcrafts[i][0]
              @required[3]=CraftsList.getcrafts[i][3]
            end
            if CraftsList.getcrafts[i][2]!=@itemA && @itemA==:NO
              @itemA=:NO
              @quantA=0
            end
            if CraftsList.getcrafts[i][2]!=@itemB && @itemB==:NO
              @itemB=:NO
              @quantB=0
            end
          end
        else
          Kernel.pbMessage(_INTL("You must first select an item!"))
        end
         @quantA=$PokemonBag.pbQuantity(@itemA)
         @quantB=$PokemonBag.pbQuantity(@itemB)
         @quantC=$PokemonBag.pbQuantity(@itemC)
      end
       #Cancel
      if Input.trigger?(Input::BACK)
        return -1
      end     
	  if Input.trigger?(Input::SPECIAL)
	    pbMessage(_INTL("A = {1}, B = {2}, C = {3} D = {4}",@itemA,@itemB,@itemC,@returnItem))
	  end
    end
  end
  
  def pbCheckRecipe(recipe)
    for i in 0..45
      if recipe[1]==CraftsList.getcrafts[i][1] &&
         recipe[2]==CraftsList.getcrafts[i][2] &&
         recipe[3]==CraftsList.getcrafts[i][3]
       return true
      end
    end
   return false
   Kernel.pbMessage(_INTL("Nope! {1}",recipe[0]))
  end
  
end



class PokemoncraftSelect
  attr_accessor :lastcraft
  attr_reader :crafts
  def numChars()
    return Crafts_Scene.CraftsList().length-1
  end
  def initialize
    @lastcraft=1
    @crafts=[]
    @choices=[]
    # Initialize each playerCharacter of the array
    for i in 0..Crafts_Scene.CraftsList
      @crafts[i]=[]
      @choices[i]=0
    end
  end
  def crafts
    rearrange()
    return @crafts
  end

  def rearrange()
    if @crafts.length==6 && Crafts_Scene.CraftsList==28
      newcrafts=[]
      for i in 0..28
        newcrafts[i]=[]
        @choices[i]=0 if !@choices[i]
      end
      @crafts=newcrafts
    end
  end
end

module CraftsList
  def self.getcrafts
    @CraftsList=[
	#[RESULT = Item 1 + Item 2 + Item 3]
    [:NO,:NO,:NO,:NO], #Empty
    #RECIPE 1: 
    [:TEA,:NO,:FRESHWATER,:TEALEAF],  
    [:TEA,:NO,:TEALEAF,:FRESHWATER],  
    [:TEA,:TEALEAF,:NO,:FRESHWATER],  
    [:TEA,:TEALEAF,:FRESHWATER,:NO], 
    [:TEA,:FRESHWATER,:TEALEAF,:NO],  
    [:TEA,:FRESHWATER,:NO,:TEALEAF],  
    #RECIPE 2: 
    [:SWEETHEART,:NO,:SUGAR,:CHOCOLATE],  
    [:SWEETHEART,:NO,:CHOCOLATE,:SUGAR],  
    [:SWEETHEART,:CHOCOLATE,:NO,:SUGAR],  
    [:SWEETHEART,:CHOCOLATE,:SUGAR,:NO],  
    [:SWEETHEART,:SUGAR,:NO,:CHOCOLATE],  
    [:SWEETHEART,:SUGAR,:CHOCOLATE,:NO],  
    #RECIPE 3: 
    [:CARROTCAKE,:BOWL,:SUGAR,:COCOABEANS],  
    [:CARROTCAKE,:BOWL,:COCOABEANS,:SUGAR],  
    [:CARROTCAKE,:SUGAR,:COCOABEANS,:BOWL],  
    [:CARROTCAKE,:SUGAR,:BOWL,:COCOABEANS],  
    [:CARROTCAKE,:COCOABEANS,:SUGAR,:BOWL],  
    [:CARROTCAKE,:COCOABEANS,:BOWL,:SUGAR], 
    #RECIPE 4:  
    [:LEMONADE,:LEMON,:SUGAR,:WATERBOTTLE],  
    [:LEMONADE,:LEMON,:SUGAR,:WATERBOTTLE],  
    [:LEMONADE,:WATERBOTTLE,:SUGAR,:LEMON],  
    [:LEMONADE,:WATERBOTTLE,:LEMON,:SUGAR],  
    [:LEMONADE,:SUGAR,:LEMON,:WATERBOTTLE],  
    [:LEMONADE,:SUGAR,:WATERBOTTLE,:LEMON], 
    #RECIPE 5:  
    [:BREAD,:WHEAT,:WHEAT,:WHEAT],
    #RECIPE 6: 
    [:CHOCOLATE,:NO,:SUGAR,:COCOABEANS],
    [:CHOCOLATE,:NO,:COCOABEANS,:SUGAR],
    [:CHOCOLATE,:SUGAR,:NO,:COCOABEANS],
    [:CHOCOLATE,:SUGAR,:COCOABEANS,:NO],
    [:CHOCOLATE,:COCOABEANS,:NO,:SUGAR],
    [:CHOCOLATE,:COCOABEANS,:SUGAR,:NO],
    #RECIPE 7: 
    [:GSCURRY,:BOWL,:STARFBERRY,:WATERBOTTLE],
    [:GSCURRY,:BOWL,:WATERBOTTLE,:STARFBERRY],
    [:GSCURRY,:WATERBOTTLE,:STARFBERRY,:BOWL],
    [:GSCURRY,:WATERBOTTLE,:BOWL,:STARFBERRY],
    [:GSCURRY,:STARFBERRY,:WATERBOTTLE,:BOWL],
    [:GSCURRY,:STARFBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 8: 
    [:CRITCURRY,:BOWL,:LANSATBERRY,:WATERBOTTLE],
    [:CRITCURRY,:BOWL,:WATERBOTTLE,:LANSATBERRY],
    [:CRITCURRY,:WATERBOTTLE,:LANSATBERRY,:BOWL],
    [:CRITCURRY,:WATERBOTTLE,:BOWL,:LANSATBERRY],
    [:CRITCURRY,:LANSATBERRY,:WATERBOTTLE,:BOWL],
    [:CRITCURRY,:LANSATBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 9: 
    [:DEFCURRY,:BOWL,:BELUEBERRY,:WATERBOTTLE],
    [:DEFCURRY,:BOWL,:WATERBOTTLE,:BELUEBERRY],
    [:DEFCURRY,:WATERBOTTLE,:BELUEBERRY,:BOWL],
    [:DEFCURRY,:WATERBOTTLE,:BOWL,:BELUEBERRY],
    [:DEFCURRY,:BELUEBERRY,:WATERBOTTLE,:BOWL],
    [:DEFCURRY,:BELUEBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 10: 
    [:ACCCURRY,:BOWL,:MICLEBERRY,:WATERBOTTLE],
    [:ACCCURRY,:BOWL,:WATERBOTTLE,:MICLEBERRY],
    [:ACCCURRY,:WATERBOTTLE,:MICLEBERRY,:BOWL],
    [:ACCCURRY,:WATERBOTTLE,:BOWL,:MICLEBERRY],
    [:ACCCURRY,:MICLEBERRY,:WATERBOTTLE,:BOWL],
    [:ACCCURRY,:MICLEBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 11: 
    [:SPDEFCURRY,:BOWL,:DURINBERRY,:WATERBOTTLE],
    [:SPDEFCURRY,:BOWL,:WATERBOTTLE,:DURINBERRY],
    [:SPDEFCURRY,:WATERBOTTLE,:DURINBERRY,:BOWL],
    [:SPDEFCURRY,:WATERBOTTLE,:BOWL,:DURINBERRY],
    [:SPDEFCURRY,:DURINBERRY,:WATERBOTTLE,:BOWL],
    [:SPDEFCURRY,:DURINBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 12: 
    [:SPEEDCURRY,:BOWL,:WATMELBERRY,:WATERBOTTLE],
    [:SPEEDCURRY,:BOWL,:WATERBOTTLE,:WATMELBERRY],
    [:SPEEDCURRY,:WATERBOTTLE,:WATMELBERRY,:BOWL],
    [:SPEEDCURRY,:WATERBOTTLE,:BOWL,:WATMELBERRY],
    [:SPEEDCURRY,:WATMELBERRY,:WATERBOTTLE,:BOWL],
    [:SPEEDCURRY,:WATMELBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 13: 
    [:SATKCURRY,:BOWL,:KELPSYBERRY,:WATERBOTTLE],
    [:SATKCURRY,:BOWL,:WATERBOTTLE,:KELPSYBERRY],
    [:SATKCURRY,:WATERBOTTLE,:KELPSYBERRY,:BOWL],
    [:SATKCURRY,:WATERBOTTLE,:BOWL,:KELPSYBERRY],
    [:SATKCURRY,:KELPSYBERRY,:WATERBOTTLE,:BOWL],
    [:SATKCURRY,:KELPSYBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 14: 
    [:ATKCURRY,:BOWL,:SPELONBERRY,:WATERBOTTLE],
    [:ATKCURRY,:BOWL,:WATERBOTTLE,:SPELONBERRY],
    [:ATKCURRY,:WATERBOTTLE,:SPELONBERRY,:BOWL],
    [:ATKCURRY,:WATERBOTTLE,:BOWL,:SPELONBERRY],
    [:ATKCURRY,:SPELONBERRY,:WATERBOTTLE,:BOWL],
    [:ATKCURRY,:SPELONBERRY,:BOWL,:WATERBOTTLE],
    #RECIPE 15: 
    [:LONELYMINT,:SUGAR,:SPELONBERRY,:NO],
    [:LONELYMINT,:SUGAR,:NO,:SPELONBERRY],
    [:LONELYMINT,:NO,:SPELONBERRY,:SUGAR],
    [:LONELYMINT,:NO,:SUGAR,:SPELONBERRY],
    [:LONELYMINT,:SPELONBERRY,:NO,:SUGAR],
    [:LONELYMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 16: 
    [:ADAMANTMINT,:SUGAR,:SPELONBERRY,:NO],
    [:ADAMANTMINT,:SUGAR,:NO,:SPELONBERRY],
    [:ADAMANTMINT,:NO,:SPELONBERRY,:SUGAR],
    [:ADAMANTMINT,:NO,:SUGAR,:SPELONBERRY],
    [:ADAMANTMINT,:SPELONBERRY,:NO,:SUGAR],
    [:ADAMANTMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 17: 
    [:NAUGHTYMINT,:SUGAR,:SPELONBERRY,:NO],
    [:NAUGHTYMINT,:SUGAR,:NO,:SPELONBERRY],
    [:NAUGHTYMINT,:NO,:SPELONBERRY,:SUGAR],
    [:NAUGHTYMINT,:NO,:SUGAR,:SPELONBERRY],
    [:NAUGHTYMINT,:SPELONBERRY,:NO,:SUGAR],
    [:NAUGHTYMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 18: 
    [:BRAVEMINT,:SUGAR,:SPELONBERRY,:NO],
    [:BRAVEMINT,:SUGAR,:NO,:SPELONBERRY],
    [:BRAVEMINT,:NO,:SPELONBERRY,:SUGAR],
    [:BRAVEMINT,:NO,:SUGAR,:SPELONBERRY],
    [:BRAVEMINT,:SPELONBERRY,:NO,:SUGAR],
    [:BRAVEMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 19: 
    [:BOLDMINT,:SUGAR,:SPELONBERRY,:NO],
    [:BOLDMINT,:SUGAR,:NO,:SPELONBERRY],
    [:BOLDMINT,:NO,:SPELONBERRY,:SUGAR],
    [:BOLDMINT,:NO,:SUGAR,:SPELONBERRY],
    [:BOLDMINT,:SPELONBERRY,:NO,:SUGAR],
    [:BOLDMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 20: 
    [:IMPISHMINT,:SUGAR,:SPELONBERRY,:NO],
    [:IMPISHMINT,:SUGAR,:NO,:SPELONBERRY],
    [:IMPISHMINT,:NO,:SPELONBERRY,:SUGAR],
    [:IMPISHMINT,:NO,:SUGAR,:SPELONBERRY],
    [:IMPISHMINT,:SPELONBERRY,:NO,:SUGAR],
    [:IMPISHMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 21: 
    [:LAXMINT,:SUGAR,:SPELONBERRY,:NO],
    [:LAXMINT,:SUGAR,:NO,:SPELONBERRY],
    [:LAXMINT,:NO,:SPELONBERRY,:SUGAR],
    [:LAXMINT,:NO,:SUGAR,:SPELONBERRY],
    [:LAXMINT,:SPELONBERRY,:NO,:SUGAR],
    [:LAXMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 22: 
    [:RELAXEDMINT,:SUGAR,:SPELONBERRY,:NO],
    [:RELAXEDMINT,:SUGAR,:NO,:SPELONBERRY],
    [:RELAXEDMINT,:NO,:SPELONBERRY,:SUGAR],
    [:RELAXEDMINT,:NO,:SUGAR,:SPELONBERRY],
    [:RELAXEDMINT,:SPELONBERRY,:NO,:SUGAR],
    [:RELAXEDMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 23: 
    [:MODESTMINT,:SUGAR,:SPELONBERRY,:NO],
    [:MODESTMINT,:SUGAR,:NO,:SPELONBERRY],
    [:MODESTMINT,:NO,:SPELONBERRY,:SUGAR],
    [:MODESTMINT,:NO,:SUGAR,:SPELONBERRY],
    [:MODESTMINT,:SPELONBERRY,:NO,:SUGAR],
    [:MODESTMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 24: 
    [:MILDMINT,:SUGAR,:SPELONBERRY,:NO],
    [:MILDMINT,:SUGAR,:NO,:SPELONBERRY],
    [:MILDMINT,:NO,:SPELONBERRY,:SUGAR],
    [:MILDMINT,:NO,:SUGAR,:SPELONBERRY],
    [:MILDMINT,:SPELONBERRY,:NO,:SUGAR],
    [:MILDMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 25: 
    [:RASHMINT,:SUGAR,:SPELONBERRY,:NO],
    [:RASHMINT,:SUGAR,:NO,:SPELONBERRY],
    [:RASHMINT,:NO,:SPELONBERRY,:SUGAR],
    [:RASHMINT,:NO,:SUGAR,:SPELONBERRY],
    [:RASHMINT,:SPELONBERRY,:NO,:SUGAR],
    [:RASHMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 26: 
    [:QUIETMINT,:SUGAR,:SPELONBERRY,:NO],
    [:QUIETMINT,:SUGAR,:NO,:SPELONBERRY],
    [:QUIETMINT,:NO,:SPELONBERRY,:SUGAR],
    [:QUIETMINT,:NO,:SUGAR,:SPELONBERRY],
    [:QUIETMINT,:SPELONBERRY,:NO,:SUGAR],
    [:QUIETMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 27: 
    [:CALMMINT,:SUGAR,:SPELONBERRY,:NO],
    [:CALMMINT,:SUGAR,:NO,:SPELONBERRY],
    [:CALMMINT,:NO,:SPELONBERRY,:SUGAR],
    [:CALMMINT,:NO,:SUGAR,:SPELONBERRY],
    [:CALMMINT,:SPELONBERRY,:NO,:SUGAR],
    [:CALMMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 28: 
    [:GENTLEMINT,:SUGAR,:SPELONBERRY,:NO],
    [:GENTLEMINT,:SUGAR,:NO,:SPELONBERRY],
    [:GENTLEMINT,:NO,:SPELONBERRY,:SUGAR],
    [:GENTLEMINT,:NO,:SUGAR,:SPELONBERRY],
    [:GENTLEMINT,:SPELONBERRY,:NO,:SUGAR],
    [:GENTLEMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 29: 
    [:CAREFULMINT,:SUGAR,:SPELONBERRY,:NO],
    [:CAREFULMINT,:SUGAR,:NO,:SPELONBERRY],
    [:CAREFULMINT,:NO,:SPELONBERRY,:SUGAR],
    [:CAREFULMINT,:NO,:SUGAR,:SPELONBERRY],
    [:CAREFULMINT,:SPELONBERRY,:NO,:SUGAR],
    [:CAREFULMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 30: 
    [:SASSYMINT,:SUGAR,:SPELONBERRY,:NO],
    [:SASSYMINT,:SUGAR,:NO,:SPELONBERRY],
    [:SASSYMINT,:NO,:SPELONBERRY,:SUGAR],
    [:SASSYMINT,:NO,:SUGAR,:SPELONBERRY],
    [:SASSYMINT,:SPELONBERRY,:NO,:SUGAR],
    [:SASSYMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 31: 
    [:TIMIDMINT,:SUGAR,:SPELONBERRY,:NO],
    [:TIMIDMINT,:SUGAR,:NO,:SPELONBERRY],
    [:TIMIDMINT,:NO,:SPELONBERRY,:SUGAR],
    [:TIMIDMINT,:NO,:SUGAR,:SPELONBERRY],
    [:TIMIDMINT,:SPELONBERRY,:NO,:SUGAR],
    [:TIMIDMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 32: 
    [:HASTYMINT,:SUGAR,:SPELONBERRY,:NO],
    [:HASTYMINT,:SUGAR,:NO,:SPELONBERRY],
    [:HASTYMINT,:NO,:SPELONBERRY,:SUGAR],
    [:HASTYMINT,:NO,:SUGAR,:SPELONBERRY],
    [:HASTYMINT,:SPELONBERRY,:NO,:SUGAR],
    [:HASTYMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 33: 
    [:JOLLYMINT,:SUGAR,:SPELONBERRY,:NO],
    [:JOLLYMINT,:SUGAR,:NO,:SPELONBERRY],
    [:JOLLYMINT,:NO,:SPELONBERRY,:SUGAR],
    [:JOLLYMINT,:NO,:SUGAR,:SPELONBERRY],
    [:JOLLYMINT,:SPELONBERRY,:NO,:SUGAR],
    [:JOLLYMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 34: 
    [:NAIVEMINT,:SUGAR,:SPELONBERRY,:NO],
    [:NAIVEMINT,:SUGAR,:NO,:SPELONBERRY],
    [:NAIVEMINT,:NO,:SPELONBERRY,:SUGAR],
    [:NAIVEMINT,:NO,:SUGAR,:SPELONBERRY],
    [:NAIVEMINT,:SPELONBERRY,:NO,:SUGAR],
    [:NAIVEMINT,:SPELONBERRY,:SUGAR,:NO],
    #RECIPE 35: 
    [:SERIOUSMINT,:SUGAR,:SPELONBERRY,:NO],
    [:SERIOUSMINT,:SUGAR,:NO,:SPELONBERRY],
    [:SERIOUSMINT,:NO,:SPELONBERRY,:SUGAR],
    [:SERIOUSMINT,:NO,:SUGAR,:SPELONBERRY],
    [:SERIOUSMINT,:SPELONBERRY,:NO,:SUGAR],
    [:SERIOUSMINT,:SPELONBERRY,:SUGAR,:NO],
	#RECIPE 36:
    [:STONE,:ACORN,:REDAPRICORN,:ORANBERRY], #Empty
    ]
    return @CraftsList
  end
end

#Call Crafts.craftWindow
module Crafts  
  def self.craftWindow()
  craftScene=Crafts_Scene.new
  craftScene.pbStartScene($PokemoncraftSelect)
  craft=craftScene.pbSelectcraft
  craftScene.pbEndScene
 end
end