require "spec_helper"

module Chess
  RSpec.describe Piece do 
  
    describe "#move_to" do 
      
      it 'it move the piece to the new position' do 
        board = Board.new
        piece = board.set_piece(Piece, :black, [3, 3])
        piece.move_to(board, [4, 4])
        expect(board.get_piece([4, 4])).to be piece
      end

      it 'it moves the king to the new position' do 
        board = Board.new
        piece = board.set_piece(King, :black, [3, 3])
        piece.move_to(board, [4, 4])
        expect(board.get_piece([4, 4])).to be piece
      end
    end
  end
  
end