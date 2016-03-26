load 'moving_element.rb'
load 'bomb.rb'

class Player < MovingElement

  def initialize x, y
    super x, y, '1'

    player_path = Element.media_path('player2.png')
    @image = Gosu::Image.new(player_path)
  end

  def can_enter?
    bound = super
    bound && @static_board[@x, @y] == '0'
  end

  def draw
    @display.draw
  end

end
