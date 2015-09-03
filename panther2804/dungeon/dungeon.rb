class Dungeon

  def initialize board, elements = []
    @board = board
    @elements = elements
  end

  def [] x, y
    @elements.each { |e|
      if e.x == x && e.y == y
        return e
      end
    }
    @board[x, y]
  end

  def to_s
    0.upto(@board.boardsize - 1) do |i|
      s = ''
      0.upto(@board.boardsize - 1) do |j|
        s += self[i, j].to_s
        s += ' '
      end
      puts s
    end
  end

  def boardsize
    @board.boardsize
  end

end