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
    move_color ||= @one.color
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

  def draw_check #followed by return if check draw == true
    if @board[0].all? { |cell| !(cell.color.empty?)}
      return true
    else
      return false
    end
  end

  def win_check
    horizontal_win_check("⚫")
    horizontal_win_check("⚪")
    vertical_win_check("⚫")
    vertical_win_check("⚪")
    diagonal_win_check("⚫")
    diagonal_win_check("⚪")

    #should execute if none stops/returns
    return false
  end

  def horizontal_win_check(color)
    @board.each do |row|
      if row[0..3].all? {|x| x.color[0] == color}
        return true
        return
      end
      if row[1..4].all? {|x| x.color[0] == color}
        return true
        return
      end
      if row[2..5].all? {|x| x.color[0] == color}
        return true
        return
      end
      if row[3..6].all? {|x| x.color[0] == color}
        return true
        return
      end
    end

  end

  def vertical_win_check(color)
    columns = []

    7.times do |index|
      columns << @board.collect {|row| row[index]}
    end

    columns.each do |col|
      if col[0..3].all? {|x| x.color[0] == color}
        return true
        return
      end
      if col[1..4].all? {|x| x.color[0] == color}
        return true
        return
      end
      if col[2..5].all? {|x| x.color[0] == color}
        return true
        return
      end
    end
  end

  def diagonal_win_check(color)
    diagonals = diagonal_generator

    diagonals.each do |diagonal|
      if diagonal.all? {|x| x.color[0] == color}
        return true
        return
      end
    end
  end

  def diagonal_generator
    diagonals = []
    depth = 0

    until depth == 3
      left = 0
      right = 6
      4.times do
        diagonals << [@board[depth+0][left+0], @board[depth+1][left+1], @board[depth+2][left+2], @board[depth+3][left+3]]
        diagonals << [@board[depth+0][right-0], @board[depth+1][right-1], @board[depth+2][right-2], @board[depth+3][right-3]]

        left+=1
        right-=1
      end
      depth += 1
    end

    diagonals
  end

  def switch_players
    @one, @two = @two, @one
  end
end
