module Chess
  class Queen < Piece
    
    attr_reader :symbols

    def initialize(input = {})
      @symbols = { :black => "\u265b", :white => "\u2655" }
      super
    end

    def allowed_moves(board, arr = [])
      arr += diagonal_moves(board)
      arr += vertical_moves(board)
      arr += horizontal_moves(board)
    end
    
  end
end