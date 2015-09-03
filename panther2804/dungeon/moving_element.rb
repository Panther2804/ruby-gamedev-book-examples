load 'element.rb'

class MovingElement < Element

  def initialize x, y, char
    super
  end

  def right
    @x += 1
  end

  def left
    @x -= 1
  end

  def up
    @y -= 1
  end

  def down
    @y += 1
  end

end