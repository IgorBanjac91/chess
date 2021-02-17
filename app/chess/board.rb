module Chess
  class Board
    attr_accessor :grid
    def initialize
      @grid = set_grid
    end

    def arrange_pieces
      arrange_pawns
      arrange_rooks
      arrange_bishops
      arrange_knights
      arrange_kings
      arrange_queens
    end
    
    def black_piece?(coordinates)
      x, y = coordinates[0], coordinates[1]
      tail = grid[x][y]
      return false if tail.empty? 
      tail.content.color == :black ? true : false
    end

    def white_piece?(coordinates)
      x, y = coordinates[0], coordinates[1]
      tail = grid[x][y]
      return false if tail.empty? 
      tail.content.color == :white ? true : false
    end

    def set_piece(type, color, position)
      x, y = position[0], position[1]
      grid[x][y].content = type.new( { color: color, position: position } )
    end
    
    def get_piece(position)
      x, y = position[0], position[1]
      tile = grid[x][y]
      tile.empty? ? nil : tile.content
    end

    private
    

    def set_grid
      Array.new(8) { |c| Array.new(8) { |r| Tile.new({ x: c, y: r }) } }
    end
    
    def arrange_pawns
      grid.each_with_index do |col, index| 
        set_piece(Pawn, :black, [index, 6])
      end
      grid.each_with_index do |col, index| 
        set_piece(Pawn, :white, [index, 1])
      end    
    end

    def arrange_rooks
      set_piece(Rook, :black, [0, 7])
      set_piece(Rook, :black, [7, 7])
      set_piece(Rook, :white, [0, 0])
      set_piece(Rook, :white, [7, 0])
    end

    def arrange_bishops
      set_piece(Bishop, :black, [2, 7])
      set_piece(Bishop, :black, [5, 7])
      set_piece(Bishop, :white, [2, 0])
      set_piece(Bishop, :white, [5, 0])
    end

    def arrange_knights
      set_piece(Knight, :black, [1, 7])
      set_piece(Knight, :black, [6, 7])
      set_piece(Knight, :white, [1, 0])
      set_piece(Knight, :white, [6, 0])
    end

    def arrange_kings
      set_piece(King, :black, [4, 7])
      set_piece(King, :white, [4, 0])
    end

    def arrange_queens
      set_piece(Queen, :black, [3, 7])
      set_piece(Queen, :white, [3, 0])
    end

  end
end