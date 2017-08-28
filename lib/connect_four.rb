class Board
  attr_accessor :one, :two, :board

  def initialize
    @one = Player.new("Rick", "⚫")
    @two = Player.new("Dick", "⚪")

    @board = Array.new(6){Array.new(7){Cell.new}}
  end

  class Player
    attr_accessor :name, :color

    def initialize(name, color)
      @name = name
      @color = color
    end
  end

  class Cell
    attr_accessor :color

    def initialize(color="")
      @color = color
    end
  end

  def print_board
    @board.each do |row|
      puts row.map {|cell| cell.color.empty? ? "_" : cell.color}.join(" ")
    end
  end

  def make_move(column, *move_color)
    #move_color ||= @one.color
    depth = 5
    until depth < 0
      potential = @board[depth][column]
      if potential.color.empty?
        potential.color = move_color
        return
      else
        depth -=1
        raise ArgumentError if depth < 0 #dopraj go ova gligore
      end
    end
  end

  def check_draw #followed by return if check draw == true
  end

end
