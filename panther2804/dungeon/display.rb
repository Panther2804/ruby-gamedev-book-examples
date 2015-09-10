class Display

  def initialize
    @steps = 0
  end

  def steps_update
    @steps += 1
  end

  def info
    "[steps:#{@steps}]"
  end

  def draw
    @message = Gosu::Image.from_text(
        self, info, Gosu.default_font_name, 30)
    @message.draw(0, 0, 101, 1, 1, Gosu::Color::AQUA)
  end

end