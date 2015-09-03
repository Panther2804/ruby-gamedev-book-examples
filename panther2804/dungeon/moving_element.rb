load 'element.rb'

class MovingElement < Element

  def initialize x, y, char
    super
  end

  def right
    @x += 1
    @needs_update = true
  end

  def left
    @x -= 1
    @needs_update = true
  end

  def up
    @y -= 1
    @needs_update = true
  end

  def down
    @y += 1
    @needs_update = true
  end

end
