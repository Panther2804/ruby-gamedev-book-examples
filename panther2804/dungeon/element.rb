class Element

  def self.media_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
  end

  def initialize x, y, char
    @x_old = x
    @y_old = y
    @x = x
    @y = y
    @needs_update = true
    @char = char
    @image = Gosu::Image.from_text(self, '?', Gosu.default_font_name, GameWindow::TILESIZE)
    @static_board = nil
  end

  def to_s
    @char
  end

  def needs_update?
    @needs_update
  end

  def update
    @x_old = @x
    @y_old = @y
    @needs_update = false
  end

  def drawAt x, y
    @image.draw x, y, 0
  end

  attr_reader :x, :y

  attr_accessor :static_board

end