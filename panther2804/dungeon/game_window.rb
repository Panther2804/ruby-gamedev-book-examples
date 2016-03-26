class GameWindow < Gosu::Window

  # BACKGROUND = media_path('country_field.png')

  TILESIZE = 32
  FRAME_DELAY = 100

  def initialize(dungeon, player, fullscreen=false)
    @dungeon = dungeon
    @player = player
    @buttons = []
    pixel = @dungeon.boardsize * TILESIZE

    super pixel, pixel, fullscreen

    self.caption = "Paul's Dungeon"

    @time = Gosu.milliseconds

    #@background = Gosu::Image.new(self, BACKGROUND, false)
    #@animation = Explosion.load_animation(self)
    #@explosions = []
  end

  def update
    #@explosions.reject!(&:done?)
    #@explosions.map(&:update)
    #puts "update: #{needs_redraw?}"

    #puts "#{@buttons}"
    now = Gosu.milliseconds
    diff = now - @time
    if diff > FRAME_DELAY
      @time = now
      if @buttons.size > 0
        case @buttons.first
          when nil
            # do nothing
          when Gosu::KbUp
            @player.up
          when Gosu::KbDown
            @player.down
          when Gosu::KbLeft
            @player.left
          when Gosu::KbRight
            @player.right
          when Gosu::KbB
            @dungeon.bomb @player.x, @player.y
        end
      end
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @buttons <<= id
  end

  def button_up(id)
    if !@buttons.empty?
      b = @buttons.first
      if b == id || b == nil
        @buttons.pop
      end
    end
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
    @player.draw

    #@scene_ready ||= true
    #@background.draw(0, 0, 0)
    #@explosions.map(&:d)
    #puts "draw"

  end

end
