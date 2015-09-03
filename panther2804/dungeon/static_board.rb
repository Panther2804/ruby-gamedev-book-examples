class StaticBoard

  def initialize(count = 30, boardsize = 10, generate_walls = true)
    @a = []
    @boardsize = boardsize
    0.upto(boardsize) do |i|
      @a[i] = []
      0.upto(boardsize) do |j|
        @a[i][j] = 0
      end
    end
    if generate_walls == true
      0.upto(count) do
        r = rand(boardsize)
        r2 = rand(boardsize)
        @a[r][r2] = 2
      end
    end
  end

  def [] x, y
    @a[x][y]
  end

  def to_s
    0.upto(@boardsize - 1) do |i|
      s = ''
      0.upto(@boardsize - 1) do |j|
        s += self[i, j].to_s
        s += ' '
      end
      puts s
    end
  end

  attr_reader :boardsize

end