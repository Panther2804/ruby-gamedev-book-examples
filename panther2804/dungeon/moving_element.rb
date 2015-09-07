load 'element.rb'

class MovingElement < Element

  def initialize x, y, char
    super
  end

  def right
    x = @x
    @x += 1
    if can_enter?
      @needs_update = true
    else
      @x = x
    end
  end

  def left
    x = @x
    @x -= 1
    if can_enter?
      @needs_update = true
    else
      @x = x
    end
  end

  def up
    y = @y
    @y -= 1
    if can_enter?
      @needs_update = true
    else
      @y = y
    end
  end

  def down
    y = @y
    @y += 1
    if can_enter?
      @needs_update = true
    else
      @y = y
    end
  end

  def can_enter?
    bs = @static_board.boardsize
    0 <= @x && @x < bs && 0 <= @y && @y < bs
  end

end
