class Dungeon

  def initialize board, elements = []
    @board = board
    @elements = elements

    @elements.each do |e|
      e.static_board = board
    end
  end

  def draw
    @board.draw

    0.upto(boardsize - 1) do |i|
      0.upto(boardsize - 1) do |j|

        ii = i * GameWindow::TILESIZE
        jj = j * GameWindow::TILESIZE

        el = element i, j
        if el
          el.drawAt ii, jj
        end
      end
    end
  end

  def to_s
    s = ''
    0.upto(boardsize - 1) do |i|
      0.upto(boardsize - 1) do |j|
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

  private

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

  def element x, y
    result = @elements.select { |e|
      e.x == x && e.y == y
    }
    if result.empty?
      result = nil
    else
      result = result[0]
    end
  end


end