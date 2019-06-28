class Player
  attr_accessor :pos
  @@player_count = 0
  def initialize (pos)
    @pos = pos
    @@player_count += 1
    @@player_count == 1 ? @player_number = 1 : @player_number = 2
  end

  def to_s
    @player_number == 1 ? 'Player 1' : 'Player 2'
  end
end

class Board
  attr_writer :first, :second, :third, :forth, :fifth, :sixth, :seventh ,:eighth, :ninth
  def initialize
    @first = ' '
    @second = ' '
    @third = ' '
    @forth = ' '
    @fifth = ' '
    @sixth = ' '
    @seventh = ' '
    @eighth = ' '
    @ninth = ' '
  end

  def show
    puts "|#{@first}|#{@second}|#{@third}|"
    puts "|#{@forth}|#{@fifth}|#{@sixth}|"
    puts "|#{@seventh}|#{@eighth}|#{@ninth}|"
  end

  def game_over?(pp)
    if game_won?(pp)
      return true
    elsif game_tie?
      return true
    else
      return false
    end
  end

  def game_won? pp
    if (@first == pp && @second == pp && @third == pp) || (@forth == pp && @fifth == pp && @sixth == pp) ||
      (@seventh == pp && @eighth == pp && @ninth == pp) || (@first == pp && @forth == pp && @seventh == pp) ||
      (@second == pp && @fifth == pp && @eighth == pp) || (@third == pp && @sixth == pp && @ninth == pp) ||
      (@first == pp && @fifth == pp && @ninth == pp) || (@third == pp && @fifth == pp && @seventh == pp)
      return true
    end
  end

  def game_tie?
    (1..9).to_a.each do |n|
      if empty?(n) == false
        return false
      end
    end
    return true
  end

  def empty? number
    case number
    when 1
      @first == ' ' ? true : false
    when 2
      @second == ' ' ? true : false
    when 3
      @third == ' ' ? true : false
    when 4
      @forth == ' ' ? true : false
    when 5
      @fifth == ' ' ? true : false
    when 6
      @sixth == ' ' ? true : false
    when 7
      @seventh == ' ' ? true : false
    when 8
      @eighth == ' ' ? true : false
    when 9
      @ninth == ' ' ? true : false
    else
      false
    end
  end

  def play (number,pos)
    case number
    when 1
      @first =  pos
    when 2
      @second = pos
    when 3
      @third = pos
    when 4
      @forth = pos
    when 5
      @fifth = pos
    when 6
      @sixth = pos
    when 7
      @seventh = pos
    when 8
      @eighth = pos
    when 9
      @ninth = pos
    end
  end
end



def get_pos_answer (player)
  puts "#{player} -#{player.pos.upcase}- Choose a number from 1-9"
  pos_answer = gets.chomp
  until (1..9).to_a.include? pos_answer.to_i
    puts "#{player} -#{player.pos.upcase}- Please choose a number from 1-9"
    pos_answer = gets.chomp 
  end
  
  return pos_answer.to_i
end

puts 'Welcome to Tic Tac Toe!'
puts 'First Player, Do you want to be X or O?'

player1_pos = nil
until player1_pos == 'x' || player1_pos == 'o'
  puts 'Please type "x" or "o"'
  player1_pos = gets.chomp.downcase
end

player1_pos == 'x' ? player2_pos = 'o' : player2_pos = 'x'


player1 = Player.new(player1_pos)
player2 = Player.new(player2_pos)
board = Board.new

puts `clear`
puts "Player1 is: #{player1_pos}"
puts "Player2 is: #{player2_pos}"


while true
  board.show
  player1_choice = nil
  while !(board.empty?(player1_choice))
    player1_choice = get_pos_answer(player1)
  end
  board.play(player1_choice,player1_pos)
  if board.game_over?(player1_pos) == true
    puts `clear`
    board.show
    puts 'Player 1 has won!'
    break
  end
  puts `clear`
  board.show
  player2_choice = nil
  while !(board.empty?(player2_choice))
    player2_choice = get_pos_answer(player2)
  end
  board.play(player2_choice,player2_pos) 
  if board.game_over?(player2_pos) == true
    puts `clear`
    board.show
    puts 'Player 2 has won!'
    break
  end
  puts `clear`
end
