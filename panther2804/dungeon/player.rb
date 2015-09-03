load 'moving_element.rb'

class Player < MovingElement

  def initialize x, y
    super x, y, '1'
  end

end
