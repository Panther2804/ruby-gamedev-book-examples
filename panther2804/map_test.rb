

class Fixnum

  def func1
    self * self
  end

end

array = [ 1, 2, 5 ]

map1 = array.map { |x|
  x * x
}

puts "map1", map1.to_s


puts "func1", 3.func1

map2 = array.map(&:func1)

puts "map2", map2.to_s
