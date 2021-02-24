module Chess
  class Pawn < Piece
    
    attr_reader :white_directions, :black_directions, 
                :white_take, :black_take, :symbols
    
    def initialize( input = {} )
      @black_directions = [[0, -1]]
      @white_directions = [[0, 1]]
      @white_take = [[1, 1], [-1, 1]]
      @black_take = [[1, -1], [-1, -1]]
      @symbols = { :black => "\u265f", :white => "\u2659" }
      super
    end

    
    def allowed_moves(board, arr = [])
      return arr if front_piece?(board)
      if white?
        white_directions.each do |direction|  
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          arr << [x, y + 1] if first_move?
          arr << [x, y]
          end
        white_take.each do |direction|
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          next if off_board?([x, y])
          unless board.grid[x][y].empty?
            arr << [x, y] if board.black_piece?([x, y])
          end
        end
      else
        black_directions.each do |direction|  
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          arr << [x, y - 1] if first_move?
          arr << [x, y]
        end
        black_take.each do |direction|
          x = position[0] + direction[0]
          y = position[1] + direction[1]
          next if off_board?([x, y])
          unless board.grid[x][y].empty?
            arr << [x, y] if board.white_piece?([x, y])
          end
        end
      end
      arr 
    end
    
    private
    
    def first_move?
      if white?
        return true if position[1] == 1
      elsif black?
        return true if position[1] == 6
      end
    end

  end
end

