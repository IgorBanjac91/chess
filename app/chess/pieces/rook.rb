module Chess
  class Rook < Piece

    attr_accessor :orizontal_directions, :vertical_directions, :symbols

    def initialize(input = {})
      @symbols = { :black => "\u265c", :white => "\u2656" }
      super
    end

    def allowed_moves(board, arr = [])
      arr += vertical_moves(board)
      arr += horizontal_moves(board)
    end

  end
end