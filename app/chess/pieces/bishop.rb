module Chess
  class Bishop < Piece

    attr_reader :symbols

    def initialize(input = {})
      @symbols = { :black => "\u265d", :white => "\u2657" }
      super
    end

    def allowed_moves(board, arr = [])
      diagonal_moves(board)
    end

  end
end