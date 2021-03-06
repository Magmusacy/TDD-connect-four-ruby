require './lib/player'
class Cage
attr_accessor :cage
  def initialize()
    @cage = Array.new(42, "♿")
  end

  def show_cage(ary=@cage, finish=42)
    return puts "| | | | | | |\n1 2 3 4 5 6 7" if finish == 0
    ary[finish-7..finish-1].each { |x| print x}
    puts ""
    show_cage(ary, finish-7)
  end

  def insert(index, sign)
    p index
    index -= 1
    if index > @cage.length
      puts "Choose different position, this one has been chosen before"
      insert(gets.to_i, sign)
    end
    @cage[index] == "♿" ? @cage[index] = sign : insert(index + 8, sign)
    show_cage
  end

  def check_for_win(sign)
    row_specific = [3, 10, 17, 24, 32, 38]
    specific_case_indexes = [0,1,2,3,7,8,9,10,14,15,16,17]
    @cage.each_with_index do |elmnt, idx|
      if elmnt == sign 
        if @cage[idx+1] == sign && @cage[idx+2] == sign && @cage[idx+3] == sign && row_specific.include?(idx)
          return true
        elsif @cage[idx+7] == sign && @cage[idx+14] == sign && @cage[idx+21] == sign 
          return true
        elsif @cage[idx+8] == sign && @cage[idx+16] == sign && @cage[idx+24] == sign && specific_case_indexes.include?(idx) ||
              @cage[idx+6] == sign && @cage[idx+12] == sign && @cage[idx+18] == sign && idx > 2
          return true
        end 
      end
    end
    false
  end

end

def player_index(index) # prevents user from putting his sign on the higher array 
  if index == 0 || index > 7
    puts "Choose a number between 1 and 7 as your position"
    index = player_index(gets.to_i)
  end
  index
end

def player_input(plr, cage)
  puts "Choose your position in the cage #{plr.name} (#{plr.sign}):"
  index = player_index(gets.to_i)
  cage.insert(index, plr.sign)
  cage.check_for_win(plr.sign)
end

def game
  cage = Cage.new
  puts "Welcome to connect four\nInput player 1 name: (⚪)"
  player1 = Player.new(gets.chomp, "⚪")
  puts "Input player 2 name: (⚫)"  
  player2 = Player.new(gets.chomp, "⚫")
  has_ended = false
  i = 0
  cage.show_cage
  
  until has_ended 
    case i.even?
    when true 
      has_ended = player_input(player1, cage)
      winner = player1 if has_ended
    when false
      has_ended = player_input(player2, cage)
      winner = player2 if has_ended
    end
    i += 1
  end
  puts "Congratulations #{winner.name} for your awe-inpiring win"
  winner
end

game