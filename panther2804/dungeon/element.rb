class Element

  def initialize x, y, char
    @x = x
    @y = y
    @char = char
  end

  def to_s
    @char
  end

  attr_reader :x, :y

end