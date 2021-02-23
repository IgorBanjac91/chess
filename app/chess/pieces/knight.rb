module Chess
  class Knight < Piece

    KNIHGT_DIRECTIONS = [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]

    attr_reader :symbols

    def initialize(input = {})
      @symbols = { :black => "\u265e", :white => "\u2658" }
      super
    end

    def allowed_moves(board, arr = [])
      arr + knight_moves(board)
    end

    def knight_moves(board, arr = [])
      KNIHGT_DIRECTIONS.each do |direction| 
        pos_x = position[0]
        pos_y = position[1]
        dir_x = direction[0]
        dir_y = direction[1]
        x, y = ( pos_x + dir_x ), ( pos_y + dir_y )
        unless off_board?([x, y])
          piece = board.get_piece([x, y])
          if opponent?(piece) || board.grid[x][y].empty?
            arr << [x, y]
          else
            next
          end
        end
      end
      arr
    end
    
  end
end