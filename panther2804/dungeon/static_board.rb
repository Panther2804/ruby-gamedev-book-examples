class StaticBoard

  def self.media_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
  end

  def initialize(count = 30, boardsize = 10, generate_walls = true)
    @a = []
    @boardsize = boardsize
    0.upto(boardsize) do |i|
      @a[i] = []
      0.upto(boardsize) do |j|
        @a[i][j] = '0'
      end
    end

    if generate_walls == true
      0.upto(count) do
        r = rand(boardsize)
        r2 = rand(boardsize)
        @a[r][r2] = '2'
      end
    end

    wall_path = StaticBoard.media_path('walls.png')
    empty_path = StaticBoard.media_path('nothing.png')
    @wall = Gosu::Image.new(wall_path)
    @empty = Gosu::Image.new(empty_path)
  end

  def [] x, y
    @a[x][y]
  end

  def draw
    0.upto(@boardsize - 1) do |i|
      0.upto(@boardsize - 1) do |j|

        ii = i * GameWindow::TILESIZE
        jj = j * GameWindow::TILESIZE

        el = self[i, j]
        case el
          when '0' then @empty.draw ii, jj, 0
          when '2' then @wall.draw ii, jj, 0
        end
      end
    end
  end

  def to_s
    s = ''
    0.upto(@boardsize - 1) do |i|
      0.upto(@boardsize - 1) do |j|
        s += self[i, j].to_s
        s += ' '
      end
      s += "\n"
    end
    s += "\n"
  end

  attr_reader :boardsize

end