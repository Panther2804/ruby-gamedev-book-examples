def media_path(file)
  File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
end

class GameWindow < Gosu::Window

  # BACKGROUND = media_path('country_field.png')

  TILESIZE = 50

  def initialize(dungeon, fullscreen=false)
    @dungeon = dungeon
    pixel = @dungeon.boardsize * TILESIZE

    super pixel, pixel, fullscreen

    self.caption = 'Test'

    #@wall = Gosu::Image.from_text(self, '2', Gosu.default_font_name, TILESIZE)
    wall_path = media_path('walls.png')
    empty_path = media_path('nothing.png')
    player_path = media_path('player.png')
    @wall = Gosu::Image.new(self, wall_path, false)
    @empty = Gosu::Image.new(self, empty_path, false)
    @player = Gosu::Image.new(self, player_path, false)

    #@empty = Gosu::Image.from_text(self, '.', Gosu.default_font_name, TILESIZE)
    #@player = Gosu::Image.from_text(self, '1', Gosu.default_font_name, TILESIZE)

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
    0.upto(@dungeon.boardsize - 1) do |i|

      0.upto(@dungeon.boardsize - 1) do |j|

        ii = i * TILESIZE
        jj = j * TILESIZE
        field = @dungeon[i, j]

        if field == '0'
          @empty.draw(ii, jj, 0)
        elsif field == '1'
          @player.draw(ii, jj, 0)
        elsif field == '2'
          @wall.draw(ii, jj, 0)
        end

      end
    end

    #@scene_ready ||= true
    #@background.draw(0, 0, 0)
    #@explosions.map(&:d)
    #puts "draw"
  end

end
