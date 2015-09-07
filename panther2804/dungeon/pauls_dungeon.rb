require 'gosu'

load 'static_board.rb'
load 'player.rb'
load 'dungeon.rb'
load 'game_window.rb'

board = StaticBoard.new
puts board

player = Player.new 5, 6

dungeon = Dungeon.new board, [player]

puts dungeon

=begin
begin
  input = 'q'
  #input = gets.chomp
  case input
    when 'w' then player.up
    when 'y' then player.down
    when 'a' then player.left
    when 's' then player.right
  end
  puts dungeon
end while input != 'q'
=end

window = GameWindow.new(dungeon, player)
window.show
