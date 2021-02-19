module Chess
  class King < Piece



    def initialize(input = {})
      super
    end

    def allowed_moves(board, arr = [])
      arr += diagonal_moves(board, [], 1)
      arr += orizontal_moves(board, [], 1)
      arr += vertical_moves(board, [], 1)
    end

    def king_moves(board, arr = [])
      arr + diagonal_moves(board, [], 1)
      arr + orizontal_moves(board, [], 1)
      arr + vertical_moves(board, [], 1)
    end

    # try to make a vertical_make to make a single move by default
  end
end