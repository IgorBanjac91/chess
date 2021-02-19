module Chess
  class Bishop < Piece

    def initialize(input = {})
      super
    end

    def allowed_moves(board, arr = [])
      diagonal_moves(board)
    end
  end
end