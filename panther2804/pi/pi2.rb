radius = 1000
lastpi = 3
ausgabe = 0
outside = 0
total = 0

0.upto(9) do
  #outside = 0
  #total = 0
  0.upto(radius * radius) do
    max = radius + 1
    r1 = rand max
    r2 = rand radius
    if r1*r1 + r2*r2 > radius*radius
      outside += 1
    end
    total += 1
  end
  ausgabe += 1
  puts 'ausgabe: ' + ausgabe.to_s
  pi = 4.0 * (total - outside) / total
  puts 'radius=' << radius.to_s, 'outside=' << outside.to_s, 'total=' << total.to_s, 'pi=' << pi.to_s, pi - lastpi
  lastpi = pi
  radius += 1000
  puts '-----------'
end

puts 'berechnung ende'
puts outside, total, 4.0 * (total - outside) / total
