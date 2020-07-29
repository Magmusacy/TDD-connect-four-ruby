class Player

  def initialize(name, sign)
    @name = name
    @sign = sign  
  end

  def self.create_player(name, sign)
    Player.new(name, sign)
  end

end