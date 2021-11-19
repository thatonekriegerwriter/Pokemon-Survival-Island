ItemHandlers::UseInField    .add(:TMCASE,proc { |item|
  TMCase.new
  next 1
})


class Window_TMCase < Window_DrawableCommand
  attr_reader :pocket

  def initialize(bag,filterlist,pocket,x,y,width,height)
    @bag        = bag
    @filterlist = filterlist
    @pocket     = pocket
    @adapter = PokemonMartAdapter.new
    super(x,y,width,height)
    @selarrow  = AnimatedBitmap.new("Graphics/Pictures/selarrow")
    self.windowskin = nil
  end

  def dispose
    super
  end

  def pocket=(value)
    @pocket = value
    @item_max = (@filterlist) ? @filterlist[@pocket].length+1 : @bag.pockets[@pocket].length+1
    self.index = @bag.getChoice(@pocket)
  end

  def page_row_max; return 5; end
  def page_item_max; return 5; end

  def item
    return 0 if @filterlist && !@filterlist[@pocket][self.index]
    thispocket = @bag.pockets[@pocket]
    item = (@filterlist) ? thispocket[@filterlist[@pocket][self.index]] : thispocket[self.index]
    return (item) ? item[0] : 0
  end

  def itemCount
    return (@filterlist) ? @filterlist[@pocket].length+1 : @bag.pockets[@pocket].length+1
  end

  def itemRect(item)
    if item<0 || item>=@item_max || item<self.top_item ||
       item>self.top_item+self.page_item_max
      return Rect.new(0,0,0,0)
    else
      cursor_width = (self.width-self.borderX-(@column_max-1)*@column_spacing) / @column_max
      x = item % @column_max * (cursor_width + @column_spacing)
      y = item / @column_max * @row_height - @virtualOy
      return Rect.new(x, y, cursor_width, @row_height)
    end
  end

  def drawCursor(index,rect)
    if self.index==index
      bmp = @selarrow.bitmap
      pbCopyBitmap(self.contents,bmp,rect.x,rect.y+24)
    end
  end

  def drawItem(index,_count,rect)
    textpos = []
    rect = Rect.new(rect.x+16,rect.y+16,rect.width-16,rect.height)
    ypos = rect.y+4
    thispocket = @bag.pockets[@pocket]
    if index==self.itemCount-1
      textpos.push([_INTL("CLOSE"),rect.x,ypos,false,self.baseColor,self.shadowColor])
    else
      item = (@filterlist) ? thispocket[@filterlist[@pocket][index]][0] : thispocket[index][0]
      baseColor   = self.baseColor
      shadowColor = self.shadowColor
      textpos.push(
         [@adapter.getDisplayName(item),rect.x,ypos,false,baseColor,shadowColor]
      )
      if !GameData::Item.get(item).is_important?   # Not an HM (or infinite TM)
        qty = (@filterlist) ? thispocket[@filterlist[@pocket][index]][1] : thispocket[index][1]
        qtytext = _ISPRINTF("x{1: 3d}",qty)
        xQty    = rect.x+rect.width-self.contents.text_size(qtytext).width-16
        textpos.push([qtytext,xQty,ypos,false,baseColor,shadowColor])
      end
    end
    pbDrawTextPositions(self.contents,textpos)
  end

  def refresh
    @item_max = itemCount()
    self.update_cursor_rect
    dwidth  = self.width-self.borderX
    dheight = self.height-self.borderY
    self.contents = pbDoEnsureBitmap(self.contents,dwidth,dheight)
    self.contents.clear
    for i in 0...@item_max
      next if i<self.top_item || i>self.top_item+self.page_item_max
      drawItem(i,@item_max,itemRect(i))
    end
    drawCursor(self.index,itemRect(self.index))
  end

  def update
    super
    @uparrow.visible   = false
    @downarrow.visible = false
  end
end




class TMCase

  BASE=Color.new(248,248,248)
  SHADOW=Color.new(96,96,96)
  STATBASE=Color.new(64,64,64)
  STATSHADOW=Color.new(216,216,192)
  MOVE = true #set to false if you don't want the position of the disc to move


  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = Bitmap.new("Graphics/Pictures/TM Case/bg")
    @sprites["overlay"] = BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    @sprites["doverlay"] = BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    pbSetSystemFont(@sprites["overlay"].bitmap)
    pbSetSystemFont(@sprites["bg"].bitmap)
    pbSetSystemFont(@sprites["doverlay"].bitmap)
    @power="---"
    @accuracy="---"
    @pp="---"
    @description="---"
    @type="normal"
    @category=0
    @sprites["case"] = Sprite.new(@viewport)
    @sprites["case"].bitmap = Bitmap.new("Graphics/Pictures/TM Case/TM Case")
    @sprites["case"].x = 24
    @sprites["case"].y = 112
    @sprites["case"].z = 3
    @sprites["disc"] = Sprite.new(@viewport)
    @sprites["disc"].bitmap = Bitmap.new("Graphics/Pictures/TM Case/tm_#{@type}")
    @sprites["disc"].x = 58
    @sprites["disc"].y = 76
    @sprites["disc"].z = 1
    @sprites["disc"].visible = false
    @sprites["sticker"] = Sprite.new(@viewport)
    @sprites["sticker"].bitmap = Bitmap.new("Graphics/Pictures/TM Case/hmsticker")
    @sprites["sticker"].x = @sprites["disc"].x
    @sprites["sticker"].y = @sprites["disc"].y
    @sprites["sticker"].z = 2
    @sprites["sticker"].visible = false
    @sprites["itemlist"] = Window_TMCase.new($PokemonBag,nil,4,188,-22,344,40+32+7*32)
    @sprites["itemlist"].viewport    = @viewport
    @sprites["itemlist"].pocket      = 4
    @sprites["itemlist"].index       = 0
    @sprites["itemlist"].baseColor   = Color.new(96,96,96)
    @sprites["itemlist"].shadowColor = Color.new(208,208,200)
    @typebitmap    = AnimatedBitmap.new(_INTL("Graphics/Pictures/types"))
    @catbitmap    = AnimatedBitmap.new(_INTL("Graphics/Pictures/category"))
    overlay = @sprites["overlay"].bitmap
    pbDrawTextPositions(@sprites["bg"].bitmap,[[_INTL("TM CASE"),86,6,2,BASE,SHADOW]])
    overlay.font.size=26
    itemlist=@sprites["itemlist"]
    if itemlist.index<itemlist.itemCount-1
        movestats
        @sprites["disc"].visible = true
    else
        @power = "---"
        @accuracy= "---"
        @pp = "---"
        @description = "---"
    end
    textpos = [
         [_INTL("#{@power}   "),154,292,2,STATBASE,STATSHADOW],
         [_INTL("#{@accuracy}%  "),154,317,2,STATBASE,STATSHADOW],
         [_INTL("#{@pp} PP"),154,343,2,STATBASE,STATSHADOW]
    ]
    drawTextEx(@sprites["doverlay"].bitmap,192,244,320,4,@description,BASE,SHADOW)
    pbDrawTextPositions(overlay,textpos)
    pbFadeInAndShow(@sprites)
    main
  end


  def movestats
      overlay=@sprites["overlay"].bitmap
      itemlist=@sprites["itemlist"]
      move = GameData::Item.get(itemlist.item).move
    # Get data for selected move
      if move
        moveData = GameData::Move.try_get(move)
        @power = moveData.base_damage
        @power = "---" if @power == 0 || @power == 1
        @category = moveData.category
        @accuracy = moveData.accuracy
        @accuracy = "---" if @accuracy == 0
        @pp   = moveData.total_pp
        @pp = "---" if @pp == 0
        @description   = moveData.description
        type = moveData.type
        type = 0 if type == nil
        @category = 0 if @category == nil
        @description = "" if @description == nil
        type = GameData::Type.try_get(type)
        @type = type.real_name.downcase
        typerect = Rect.new(0,type.id_number*28,64,28)
        overlay.blt(114,244,@typebitmap.bitmap,typerect)
        catrect = Rect.new(0,@category*28,64,28)
        overlay.blt(114,272,@catbitmap.bitmap,catrect)
        @sprites["disc"].bitmap = Bitmap.new("Graphics/Pictures/TM Case/tm_#{@type}")
      else
        @power = "---"
        @accuracy= "---"
        @pp = "---"
        @category = 0
        @description = ""
      end
  end


  def main
    loop do
      @sprites["doverlay"].bitmap.clear
      overlay=@sprites["overlay"].bitmap
      overlay.clear
      itemlist=@sprites["itemlist"]
      @sprites["disc"].visible=(itemlist.index<itemlist.itemCount-1)
      if itemlist.index<itemlist.itemCount-1
        movestats
      else
          @power = ""
          @accuracy= ""
          @pp = ""
          @description = ""
      end
      @sprites["sticker"].visible = (GameData::Item.get(itemlist.item).is_HM?) if itemlist.index<itemlist.itemCount-1
      @sprites["sticker"].x = @sprites["disc"].x
      @sprites["sticker"].y = @sprites["disc"].y
      textpos = [
         [_INTL("#{@power}   "),154,292,2,STATBASE,STATSHADOW],
         [_INTL("#{@accuracy}%  "),154,317,2,STATBASE,STATSHADOW],
         [_INTL("#{@pp} PP"),154,343,2,STATBASE,STATSHADOW]
        ]
      pbDrawTextPositions(overlay,textpos)
      drawTextEx(@sprites["doverlay"].bitmap,192,244,320,4,@description,BASE,SHADOW)
      Graphics.update
      Input.update
      if Input.trigger?(Input::RIGHT) && $game_variables[1]==8
        $game_variables[1]=1
        break
      elsif Input.trigger?(Input::LEFT) && $game_variables[1]==8
        $game_variables[1]=0
        break
      elsif Input.trigger?(Input::DOWN)  || Input.repeat?(Input::DOWN)
          if itemlist.itemCount>1
            pbPlayCursorSE
            if itemlist.index<itemlist.itemCount-1
              itemlist.index+=1
            else
              itemlist.index=0
              @sprites["disc"].x = 58
              @sprites["disc"].y = 76
            end
          end
          if itemlist.index<itemlist.itemCount-1 && itemlist.index>0 && 
            MOVE==true && @sprites["disc"].x > 24
              @sprites["disc"].x -= 1
              @sprites["disc"].y += 1
          end
      elsif Input.trigger?(Input::UP)  || Input.repeat?(Input::UP)
        if itemlist.itemCount>1
            pbPlayCursorSE
            if itemlist.index>0
              itemlist.index-=1
              if @sprites["disc"].x < 58  && MOVE==true && itemlist.index < 35
                  @sprites["disc"].x += 1
                  @sprites["disc"].y -= 1
                end
            else
              itemlist.index=itemlist.itemCount-1
              if MOVE==true
                  @sprites["disc"].x = (58-[itemlist.itemCount,34].min)
                  @sprites["disc"].y = (76+[itemlist.itemCount,34].min)
             end
            end
        end
      elsif Input.trigger?(Input::C)
        if itemlist.index<itemlist.itemCount-1
          pbUseItem($PokemonBag,itemlist.item)
          itemlist.refresh
        else
          break
        end
      elsif Input.trigger?(Input::A)
        choice = pbMessage(_INTL("Sort by"),
                [_INTL("Number"),
                _INTL("Type"),
                _INTL("Category"),
                _INTL("Base Power"),
                _INTL("Accuracy"),
                _INTL("Name"),
                _INTL("Cancel")
                ])
        sortarray = []
          for i in 0...$PokemonBag.pockets[4].length
            item = $PokemonBag.pockets[4][i][0]
            move = GameData::Item.get(item).move
            moveData = GameData::Move.try_get(move)
            type = moveData.type
            cat = moveData.category
            power =  moveData.base_damage
            accuracy =  moveData.accuracy
            name = moveData.real_name
            sortarray.push [item,type,cat,power,accuracy,name]
          end
        if choice == 0
          $PokemonBag.pockets[4].sort!
        else
          sortarray.sort!  { |a,b| (a[choice]==b[choice]) ? a[0]<=>b[0] : a[choice]<=>b[choice] }
          for i in 0...$PokemonBag.pockets[4].length
            $PokemonBag.pockets[4][i][0]=sortarray[i][0]
          end
          itemlist.refresh
        end
      elsif Input.trigger?(Input::B)
        break
      end
    end
    pbSEPlay("GUI menu close",80)
    pbFadeOutAndHide(@sprites)
    $PokemonBag.pockets[4].sort!
    dispose
  end

  def dispose
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end