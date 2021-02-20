module Chess
  class Rook < Piece

    attr_accessor :orizontal_directions, :vertical_directions
    def intitialize
      super
    end

    def allowed_moves(board, arr = [])
      arr += vertical_moves(board)
      arr += horizontal_moves(board)
    end

  end
end