module Chess
  class Board
    attr_accessor :grid
    def initialize
      @grid = set_grid
    end

    def arrange_pieces
      arrange_pawns
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

    private
    
    def set_grid
      Array.new(8) { |c| Array.new(8) { |r| Tile.new({ x: c, y: r }) } }
    end
    
    def arrange_pawns
      grid.each_with_index do |col, index| 
        col[6].content = Pawn.new( { color: :black, position: [index, 6] } )
      end
      grid.each_with_index do |col, index| 
        col[1].content = Pawn.new( { color: :white, position: [index, 1] } )
      end    
    end

  end
end