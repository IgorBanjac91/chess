module Chess
  class Piece
    attr_accessor :color, :position
    def initialize(input = {})
      @color = input.fetch(:color)
      @position = input.fetch(:position, [0, 0])    
    end
  end

  def white?
    true if color == :white
  end
  
  def black?
    true if color == :black
  end

  private

    def first_move?
      if white?
        return true if position[1] == 1
      elsif black?
        return true if position[1] == 6
      end
    end

    def front_piece?(board)
      x, y = position[0], position[1]
      if white?
        return true unless board.grid[x][y + 1].empty?
      elsif black?
        return true unless board.grid[x][y - 1].empty?
      end
    end
end