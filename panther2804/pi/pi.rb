outside = 0
total = 0
lastpi = 3
ausgabe = 0
0.upto(100) do
  0.upto(100000) do
    r1 = rand
    r2 = rand
    if r1*r1 + r2*r2 >= 1
      outside += 1
    end
    total += 1
  end
  ausgabe += 1
  puts 'ausgabe: ' + ausgabe.to_s
  pi = 4.0 * (total - outside) / total
  puts outside, total, pi, pi - lastpi
  lastpi = pi
  puts '-----------'
end

puts 'berechnung ende'
puts outside, total, 4.0 * (total - outside) / total