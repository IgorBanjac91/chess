module Chess
  class Queen < Piece
    
    def initialize(input = {})
      super
    end

    def allowed_moves(board, arr = [])
      arr += diagonal_moves(board)
      arr += vertical_moves(board)
      arr += orizontal_moves(board)
    end
  end
end