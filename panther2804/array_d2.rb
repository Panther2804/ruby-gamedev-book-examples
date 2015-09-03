# Pauls erstes Spiel
puts 'Dungeon Player by Pather2804 v0.0.5 (ALPHA)'
sleep 2
def init2d 
  array = []
  0.upto(10) do |i|
    array[i] = []
    0.upto(10) do |j|
      array[i][j] = 0
    end
  end
  array
end
puts 'stating’'
def print2d a
  0.upto(a.length - 1) do |i|
    s = ''
    b = a[i]
    0.upto(b.length - 1) do |e|
      s += b[e].to_s
      s += ' '
    end
    puts s
  end
end

a = init2d
puts 'loading ....'
puts ""

x = 5
y = 7
a[5][7] = 1
a[5][6] = 2
print2d a
##############################
#mein code                   #
##############################
h = 1
test = false #climb auf 1
mom = true # = monster movement
moms = true # mom system
cs = false # climb system 
ma = false # build mode
rc = false #rock cracker
edit = false # startparameter
vic = true
trap = true
b = 1
btimer = 2
bomb2 = false
while true
bombpos = Hash.new 

def help
  puts 'mo monster
  hnum health
  vic victory
  mo monster movement
  mo0
  ma making
  rc rockckracer
  rcon
  w vorwards
  s backwards
  a left
  d right 
  enter to move
  or to execute a command
  tr trap
  q rock
  '
end
puts 'almost done...'
puts 'h' if edit == true
h = gets.chomp.to_i if edit == true
puts 'ma' if edit == true
eing = gets.chomp if edit == true
ma = true if eing == 1 && edit == true
ma = false if eing == 0 && edit == true

0.upto(30) do
  r = rand(10)
  r2 = rand(10)
  a[r][r2] = 2 if ma == false
end

 mo1 = rand(10)
  mo2 = rand(10)
  a[mo1][mo2] = '%' if ma == false

 r = rand(10)
  r2 = rand(10)
  a[r][r2] = 4 if ma == false
 puts 'ready...' 
   r = rand(10)
  r2 = rand(10)
  a[r][r2] = '§'
c = 1 if test == true
c = 0 if test == false
print2d a
while true 
 # a[x][y] = 0 if (a[x][y] != 'x' || a[x][y] != 'r')
  if a[x][y] == 1
    a[x][y] = 0 
  end
  m = gets.chomp
  if c == 0
    y = y - 1 if m == 'a' && a[x][y-1] != 2 && a[x][y-1] != 'r'
    y = y + 1 if m == 'd' && a[x][y+1] != 2 && a[x][y+1] != 'r'
    x = x - 1 if m == 'w' && a[x-1][y] != 2 && a[x-1][y] != 'r'
    x = x + 1 if m == 's' && a[x+1][y] != 2 && a[x-1][y] != 'r'
  else
    a[x][y] = 2 if cs == true
  y = y - 1 if m == 'a' #&& a[x][y-1] != 2
  y = y + 1 if m == 'd' #&& a[x][y+1] != 2
  x = x - 1 if m == 'w' #&& a[x-1][y] != 2
  x = x + 1 if m == 's' #&& a[x+1][y] != 2  
  if a[x][y] == 2  
    cs = true if rc == false
  else 
    cs = false 
  end
  end
  a[mo1][mo2] = '!'
  mo2 = mo2 + 1 if moms == true && mom == true
  mo2 = mo2 - 1 if moms == false && mom == true
  if moms == true 
    moms = false
  else
    moms = true
  end 
  a[mo1][mo2] = '%'
  break if a[x][y] == '§' if vic == true
  break if a[x][y] == '%' && h == 0
  h = h - 1 if a[x][y] == '%'
    c = c + 1 if a[x][y] == 4
    h = h - 1 if a[x][y] == 'x' if trap == true
  a[x][y] = 1
  a[x][y] = 2 if m == 'q' && ma == true
  cs = true if m == 'q' && ma == true 
  h = 1 if m == 'h' && ma == true
  ma = true if m == 'ma' 
  ma = false if m == 'ma0' && ma == true
  vic = false if m == 'vicfalse' && ma == true
  vic = true if m == 'victrue' && ma == true
  rc = true if m == 'rcon' && ma == true
  rc = false if m == 'rc' && ma == true
  c = 0 if m == 'c0' && ma == true
  c = 1 if m == 'c1' && ma == true
  break if m == 'break'&& ma == true
  trap = true if m == 'trapon' && ma == true
  trap = false if m == 'trapoff' && ma == true
  a[x][y] = 'x' if m == 'tr' && ma == true
  a[x][y] = '§' if m == 'vic' && ma == true
  mo1 = x if m == 'mo' && ma == true
  mo2 = y if m == 'mo' && ma == true
  a[x][y] = 'r' if m == 'r' && ma == true
  b = b + 1 if m == 'bomb' && ma == true
  if m == 'hnum' && ma == true
    puts 'hp ?'
    h = gets.chomp.to_i 
  end
  if m == 'qb'
    a[x][y] = '@'
    bomb2 = true 
    bombpos['1'] = x
    bombpos['2'] = y
    btimer = 3
  end
    btimer = btimer - 1  if bomb2 == true
      if btimer == 0       
         a[bombpos['1']-1][bombpos['2']] = 0 if  a[bombpos['1']-1][bombpos['2']] == 'r'
         a[bombpos['1']+1][bombpos['2']] = 0 if a[bombpos['1']+1][bombpos['2']] == 'r' 
         a[bombpos['1']][bombpos['2']+1] = 0 if a[bombpos['1']][bombpos['2']+1] == 'r'
         a[bombpos['1']][bombpos['2']-1] = 0 if a[bombpos['1']][bombpos['2']-1] == 'r'
         a[bombpos['1']][bombpos['2']] = 0
       end
      
  if m == 'tp' && ma == true
    puts 'x'
    x = gets.chomp.to_i
    puts 'y'
    y = gets.chomp.to_i
  end
  break if h == 0
  mom = true if m == 'mtrue'
  mom = false if m == 'mfalse'
  print2d a
  puts '-----------climb:'+ c.to_s + ' health:'+ h.to_s if ma == false
    puts '-----------climb:'+ c.to_s + ' health:'+ h.to_s + ' ma:'+ma.to_s+' rc:'+rc.to_s+' mom:'+mom.to_s+' vic:'+vic.to_s+ ' trap:'+ trap.to_s + ' b:' + b.to_s  if ma == true
      help if m == 'help'
  puts 'help for help' if m == ''
end
# ich hab die 100 genackt yay !
puts 'you win !' if a[x][y] == '§'
puts 'you loose!! 
you big looser !' if h == 0
e =gets.chomp 
break if e == 'end'
end
