module Chess
  class Piece

    VERTICAL_DIRECTIONS = [[0, 1], [0, -1]]
    ORIZONTAL_DIRECTIONS = [[1, 0], [-1, 0]]
    DIAGONAL_DIRECTIONS = [[1, 1], [-1, 1], [-1, -1], [1,-1]]

    attr_accessor :color, :position
    def initialize(input = {})
      @color = input.fetch(:color)
      @position = input.fetch(:position, [0, 0])    
    end

    def white?
      true if color == :white
    end
    
    def black?
      true if color == :black
    end

    def opponent?(piece)
      return false if piece == nil
      true if piece.color != self.color
    end


    def diagonal_moves(board, arr = [], move_range = 7)
      DIAGONAL_DIRECTIONS.each do |direction|
        dist_par = 1
        dir_x, dir_y = direction[0], direction[1]
        pos_x, pos_y = position[0], position[1]
        x = dir_x + pos_x
        y = dir_y + pos_y
        while dist_par <= move_range
          break if off_board?([x, y])
          unless board.content_at([x, y]).empty?
            piece = board.get_piece([x, y])
            if opponent?(piece)
              arr << [x, y]
              break
            else
              break
            end
          end
          x = (dir_x * dist_par) + pos_x
          y = (dir_y * dist_par) + pos_y
          arr << [x, y] unless off_board?([x, y])
          dist_par += 1
        end
        dist_par = 1
      end
      arr
    end

    def orizontal_moves(board, arr = [], move_range = 7)
      ORIZONTAL_DIRECTIONS.each do |direction| 
        dist_par = 1
        y = position[1]
        pos_x = position[0]
        dir_x = direction[0] 
        x = pos_x + (dir_x * dist_par)
        while dist_par <= move_range
          break if off_board?([x, y])
          unless board.grid[x][y].empty?
            piece = board.get_piece([x, y])
            if opponent?(piece)
              arr << [x, y]
              break
            else
              break
            end
          end
          arr << [x, y] unless off_board?([x, y])
          dist_par += 1
          x = pos_x + (dir_x * dist_par)
        end
      end
      arr
    end

    def vertical_moves(board, arr = [], move_range = 7)
      VERTICAL_DIRECTIONS.each do |direction| 
        dist_par = 1
        x = position[0]
        pos_y = position[1]
        dir_y = direction[1] 
        y = pos_y + (dir_y * dist_par)
        while dist_par <= move_range
          break if off_board?([x, y])
          unless board.grid[x][y].empty?
            piece = board.get_piece([x, y])
            if opponent?(piece)
              arr << [x, y]
              break
            else
              break
            end
          end
          arr << [x, y] unless off_board?([x, y])
          dist_par += 1
          y = pos_y + (dir_y * dist_par)
        end
      end
      arr
    end

    private

      def front_piece?(board)
        x, y = position[0], position[1]
        if white?
          return true unless board.grid[x][y + 1].empty?
        elsif black?
          return true unless board.grid[x][y - 1].empty?
        end
      end

      def off_board?(coordinates)
        true if (coordinates[0] > 7 || coordinates[0] < 0) || (coordinates[1] > 7 || coordinates[1] < 0)
      end
  end

end