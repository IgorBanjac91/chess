module Chess
  class Pawn
    
    attr_reader :white_directions, :black_directions, 
                :white_take, :black_take
    attr_accessor :position, :color

    def initialize( input = {} )
      @color = input.fetch(:color)
      @position = input.fetch(:position, [0, 0])
      @black_directions = [[0, -2], [0, -1]]
      @white_directions = [[0, 2], [0, 1]]
      @white_take = [[1, 1], [-1, 1]]
      @black_take = [[1, -1], [-1, -1]]
    end


    def allowed_moves(board, arr = [])
      return arr if front_piece?(board)
      if white?
        white_directions.shift unless first_move?  
        white_directions.each do |direction|  
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          arr << [x, y]
        end
        white_take.each do |direction|
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          unless board.grid[x][y].empty?
            arr << [x, y] if board.black_piece?([x, y])
          end
        end
      else
        black_directions.shift unless first_move?
        black_directions.each do |direction|  
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          arr << [x, y]
        end
        black_take.each do |direction|
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          unless board.grid[x][y].empty?
            arr << [x, y] if board.white_piece?([x, y])
          end
        end
      end
      arr
    end
    
    private
    
      def white?
        true if color == :white
      end
      
      def black?
        true if color == :black
      end
      
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
end

