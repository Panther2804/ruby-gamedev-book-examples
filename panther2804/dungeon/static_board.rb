class StaticBoard

  EMPTY_CELL = '0'
  WALL_CELL = '2'
  BOMB_CELL = '3'

  def self.media_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), 'media', file)
  end

  def initialize(count = 50, boardsize = 15, generate_walls = false)
    @a = []
    @boardsize = boardsize
    0.upto(boardsize) do |i|
      @a[i] = []
      0.upto(boardsize) do |j|
        @a[i][j] = EMPTY_CELL
      end
    end

    if generate_walls == true
      0.upto(count) do
        r = rand(boardsize)
        r2 = rand(boardsize)
        @a[r][r2] = WALL_CELL
      end
    end

    x=0
    y=0
    @a[x][y] = '2'

    if generate_walls == false
      (0..boardsize-2).step(2) do |x|
       (0..boardsize-2).step(2) do |y|
        # x =+2
        @a[x + 1][y + 1] = WALL_CELL
       end
      end
    end

    wall_path = StaticBoard.media_path('Stone.png')
    empty_path = StaticBoard.media_path('ground.png')
    bomb_path = StaticBoard.media_path('bomb.png')

    @wall = Gosu::Image.new(wall_path)
    @empty = Gosu::Image.new(empty_path)
    @bomb = Gosu::Image.new(bomb_path)
  end

  def [] x, y
    @a[x][y]
  end

  def dropBomb x, y
    @a[x][y] = BOMB_CELL
  end

  def draw
    0.upto(@boardsize - 1) do |i|
      0.upto(@boardsize - 1) do |j|

        ii = i * GameWindow::TILESIZE
        jj = j * GameWindow::TILESIZE

        el = self[i, j]
        case el
          when EMPTY_CELL then @empty.draw ii, jj, 0
          when WALL_CELL then @wall.draw ii, jj, 0
          when BOMB_CELL then @bomb.draw ii, jj, 0
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
