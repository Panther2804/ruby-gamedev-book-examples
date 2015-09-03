class Dungeon

  def initialize board, elements = []
    @board = board
    @elements = elements
  end

  def [] x, y
    result = @elements.select { |e|
      e.x == x && e.y == y
    }
    if result.empty?
      result = @board[x, y]
    else
      result = result[0].to_s
    end
  end

  def to_s
    s = ''
    0.upto(@board.boardsize - 1) do |i|
      0.upto(@board.boardsize - 1) do |j|
        s += self[i, j].to_s
        s += ' '
      end
      s += "\n"
    end
    s += "\n"
  end

  def boardsize
    @board.boardsize
  end

end