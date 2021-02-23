module Chess
  class King < Piece

    attr_reader :symbols

    def initialize(input = {})
      @symbols = { :black => "\u265a", :white => "\u2654" }
      super
    end

    def allowed_moves(board, arr = [])
      arr += diagonal_moves(board, [], 1)
      arr += horizontal_moves(board, [], 1)
      arr += vertical_moves(board, [], 1)
    end
  end
end