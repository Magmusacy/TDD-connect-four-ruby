require './player'
class Cage
attr_accessor :cage
  def initialize()
    @cage = Array.new(42, "♿")
  end

  def show_cage(ary=@cage, finish=42)
    return if finish == 0
    ary[finish-7..finish-1].each { |x| print x}
    puts ""
    show_cage(ary, finish-7)
  end

  def insert(index, sign)
    index -= 1
    if index > @cage.length 
      puts "Choose different position, this one has been chosen before"
    end
    @cage[index] == "♿" ? @cage[index] = sign : insert(index + 7, sign)
  end

  def check_for_win(sign)
    #row case
    @cage.each_with_index do |elmnt, idx|
      if elmnt == sign 
        if @cage[idx+1] == sign && @cage[idx+2] == sign && @cage[idx+3] == sign 
          return true
        elsif @cage[idx+7] == sign && @cage[idx+14] == sign && @cage[idx+21] == sign 
          return true
        elsif @cage[idx+8] == sign && @cage[idx+16] == sign && @cage[idx+24] == sign ||
              @cage[idx-8] == sign && @cage[idx-16] == sign && @cage[idx-24] == sign ||
              @cage[idx+6] == sign && @cage[idx+12] == sign && @cage[idx+16] == sign ||
              @cage[idx-6] == sign && @cage[idx-12] == sign && @cage[idx-16] == sign
          return true
        end 
      end
    end

  end


end

cage = Cage.new
cage.cage[0] = "⚪"
cage.cage[1] = "⚪"
cage.cage[2] = "⚪"
cage.cage[3] = "⚪"
p cage.cage
p cage.check_for_win("⚪")