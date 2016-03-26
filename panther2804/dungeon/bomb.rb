class Bomb < Element

  def initialize x, y
    super x, y, 'b'

    bomb_path = Element.media_path('bomb.png')
    @image = Gosu::Image.new(bomb_path)
  end

  def update
    super.update
  end

end
