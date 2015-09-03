class GameWindow < Gosu::Window

  # BACKGROUND = media_path('country_field.png')

  TILESIZE = 50

  def initialize(dungeon, fullscreen=false)
    @dungeon = dungeon
    pixel = @dungeon.boardsize * TILESIZE

    super pixel, pixel, fullscreen

    self.caption = "Paul's Dungeon"

    #@background = Gosu::Image.new(self, BACKGROUND, false)
    #@animation = Explosion.load_animation(self)
    #@explosions = []
  end

  def update
    #@explosions.reject!(&:done?)
    #@explosions.map(&:update)
    #puts "update: #{needs_redraw?}"
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    #if id == Gosu::MsLeft
    #  @explosions.push(
    #      Explosion.new(@animation, mouse_x, mouse_y))
    #end
  end

  def needs_cursor?
    true
  end

  def needs_redraw?
    #!@scene_ready || @explosions.any?
    true
  end

  def draw
    @dungeon.draw

    #@scene_ready ||= true
    #@background.draw(0, 0, 0)
    #@explosions.map(&:d)
    #puts "draw"

  end

end
