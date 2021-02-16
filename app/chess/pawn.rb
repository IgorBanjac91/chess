module Chess
  class Pawn
    
    attr_reader :color, :position
    def initialize( input = {} )
      @color = input.fetch(:color)
      @position = input.fetch(:position)
      @directions = [[0, 2], [0, 1]]
      @white_take = [[1, 1], [-1, 1]]
      @black_take = [[1, -1], [-1, -1]]
    end

    def allowed_moves(to, board, arr = [])
      directions.shift if first_move?
      
    end
    
    private
    
      def white?
        true if color == :white
      end
      
      def black?
        true if coloer == :black
      end
      
      def first_move?
        if white?
          return true if position[1] != 2
        elsif black?
          return true if position[1] != 6
        end
      end

  end
end

