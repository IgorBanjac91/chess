module Chess
  class King < Piece



    def initialize(input = {})
      super
    end

    def allowed_moves(board, arr = [])
      arr += diagonal_moves(board, [], 1)
      arr += horizontal_moves(board, [], 1)
      arr += vertical_moves(board, [], 1)
    end
  end
end