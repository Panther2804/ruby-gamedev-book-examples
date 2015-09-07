load 'moving_element.rb'

class Player < MovingElement

  def initialize x, y
    super x, y, '1'

    player_path = Element.media_path('player_small.png')
    @image = Gosu::Image.new(player_path)
  end

  def can_enter?
    bound = super
    bound && @static_board[@x, @y] == '0'
  end

end
