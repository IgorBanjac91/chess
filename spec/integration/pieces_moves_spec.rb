require 'spec_helper'

module Chess
  RSpec.describe 'pieces allowed moves' do 

    let(:board) { Board.new }

    describe 'pawn moves' do 

      let (:white_pawn) { Pawn.new( { color: :white } )}
      let (:white_pawn_2) { Pawn.new( { color: :white } )}
      let (:black_pawn) { Pawn.new( { color: :black } )}
      let (:black_pawn_2) { Pawn.new( { color: :black } )}
      let (:board) { Board.new } # Empty board

      context "when is white" do 
        context "in the starting position" do 
          it 'can move one or two step forward' do 
            white_pawn.position = [2, 1]
            moves = white_pawn.allowed_moves(board)
            expect(moves).to eq [[2, 3], [2, 2]]
          end
        end

        context "with a pice in the front" do 
          it 'has no moves' do 
            white_pawn.position = [2, 1]
            black_pawn.position = [2, 2]
            board.grid[2][2].content = black_pawn
            moves = white_pawn.allowed_moves(board)
            expect(moves).to eq []
          end
        end
        
        context "when there are pieces in front-diagonally" do 
          it 'can move diagnally' do 
            white_pawn.position = [2, 1]
            black_pawn.position = [3, 2]
            board.grid[3][2].content = black_pawn
            black_pawn_2.position = [1, 2]
            board.grid[1][2].content = black_pawn_2
            moves = white_pawn.allowed_moves(board)
            expect(moves).to contain_exactly [2, 3], [2, 2], [1, 2], [3, 2]
          end
        end
      end
      
      context "when is black" do 
        context "in the starting position" do 
          it 'can move one or two step forward' do 
            black_pawn.position = [2, 6]
            moves = black_pawn.allowed_moves(board)
            expect(moves).to eq [[2, 4], [2, 5]]
          end
        end
        
        context "with a pice in the front" do 
          it 'has no moves' do 
            black_pawn.position = [2, 6]
            white_pawn.position = [2, 5]
            board.grid[2][5].content = white_pawn
            moves = black_pawn.allowed_moves(board)
            expect(moves).to eq []
          end

          context "when there are pieces in front-diagonally" do 
            it 'can move that way' do 
              black_pawn.position = [2, 6]
              white_pawn.position = [1, 5]
              board.grid[1][5].content = white_pawn
              white_pawn_2.position = [3, 5]
              board.grid[3][5].content = white_pawn_2
              moves = black_pawn.allowed_moves(board)
              expect(moves).to contain_exactly [2, 5], [2, 4], [1, 5], [3, 5]
            end
          end
        end
      end
    end

    describe 'rook moves' do 
      context "wiht no obastacols" do 
        it 'can move vertically and orizzontaly until obstacol' do
          board = Board.new
          rook = Rook.new( {color: :black, position: [3, 4]} )
          expect(rook.allowed_moves(board)).to contain_exactly [3, 3], [3, 2], [3, 1], [3, 0], [3, 5], [3, 6], [3, 7],
                                                               [2, 4], [1, 4], [0, 4], [4, 4], [5, 4], [6, 4], [7, 4] 
        end
      end

      context 'when the game starts' do 
        it 'has no moves' do 
          board = Board.new
          board.arrange_pieces
          rook = board.get_piece([0, 7])
          expect(rook.allowed_moves(board)).to eq []
        end
      end

      context 'when surrounded by opponents' do 
        it 'can make 4 moves' do 
          board = Board.new
          board.set_piece(Rook, :black, [3, 3] )
          board.set_piece(Pawn, :white, [3, 4] )
          board.set_piece(Pawn, :white, [3, 2] )
          board.set_piece(Pawn, :white, [2, 3] )
          board.set_piece(Pawn, :white, [4, 3] )
          rook = board.get_piece([3, 3])
          expect(rook.allowed_moves(board)).to contain_exactly [3, 4], [3, 2], [2, 3], [4, 3]
        end
      end
    end
    
    describe 'bishop movs' do 
      context "wiht no obastacols" do 
        it 'can move diagonally until board edge' do
          board = Board.new
          bishop = Bishop.new( {color: :black, position: [3, 3] } )
          expect(bishop.allowed_moves(board)).to contain_exactly [4, 4], [5, 5], [6, 6], [7, 7], [2, 2], [1, 1], [0, 0], 
          [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]
        end
      end
      
      context 'when the game starts' do 
        it 'has no moves' do 
          board = Board.new
          board.arrange_pieces
          bishop = board.get_piece([2, 0])
          expect(bishop.allowed_moves(board)).to eq []
        end
      end
      
      context 'when surrounded by opponents' do 
        it 'can make 4 moves' do 
          board = Board.new
          board.set_piece(Bishop, :black, [3, 3] )
          board.set_piece(Pawn,   :white, [2, 4] )
          board.set_piece(Pawn,   :white, [4, 4] )
          board.set_piece(Pawn,   :white, [2, 2] )
          board.set_piece(Pawn,   :white, [4, 2] )
          bishop = board.get_piece([3, 3])
          expect(bishop.allowed_moves(board)).to contain_exactly [2, 4], [4, 4], [2, 2], [4, 2]
        end
      end
      
    end
    
    describe 'queen moves' do 
      context "wiht no obastacols" do 
        it 'can move vertically and orizzontaly until an obstacol' do
          queen = Queen.new( {color: :black, position: [3, 4]} )
          expect(queen.allowed_moves(board)).to include [3, 3], [3, 2], [3, 1], [3, 0], [3, 5], [3, 6], [3, 7],
                                                        [2, 4], [1, 4], [0, 4], [4, 4], [5, 4], [6, 4], [7, 4] 
        end
      end

      context "wiht no obastacols" do 
        it 'can move diagonally until it hits the board edge' do
          bishop = Bishop.new( {color: :black, position: [3, 3] } )
          expect(bishop.allowed_moves(board)).to contain_exactly [4, 4], [5, 5], [6, 6], [7, 7], [2, 2], [1, 1], [0, 0], 
                                                                 [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]
        end
      end

      context 'when the game starts' do 
        it 'has no moves' do 
          board.arrange_pieces
          queen = board.get_piece([3, 0])
          expect(queen.allowed_moves(board)).to eq []
        end
      end

      context 'when surrounded by opponents' do 
        it 'can make 8 moves' do 
          board.set_piece(Queen, :black, [3, 3] )
          board.set_piece(Pawn,  :white, [3, 4] )
          board.set_piece(Pawn,  :white, [3, 2] )
          board.set_piece(Pawn,  :white, [2, 3] )
          board.set_piece(Pawn,  :white, [4, 3] )
          board.set_piece(Pawn,  :white, [2, 4] )
          board.set_piece(Pawn,  :white, [4, 4] )
          board.set_piece(Pawn,  :white, [2, 2] )
          board.set_piece(Pawn,  :white, [4, 2] )
          queen = board.get_piece([3, 3])
          expect(queen.allowed_moves(board)).to contain_exactly [3, 4], [3, 2], [2, 3], [4, 3], 
                                                                [2, 4], [4, 4], [2, 2], [4, 2]
        end
      end
    end

    describe 'knight moves' do 

      context "with no obstacoles" do
        it "can do  8 'L' moves" do 
          board.set_piece(Knight, :black, [3, 3])
          knight = board.get_piece([3, 3])
          expect(knight.allowed_moves(board)).to contain_exactly [1, 2], [1, 4], [2, 1], [2, 5],
                                                                 [4, 1], [4, 5], [5, 2], [5, 4]
        end
      end

      context 'in the starting position' do 
        it "can do 2 moves" do 
          board.arrange_pieces
          knight = board.get_piece([1, 7])
          expect(knight.allowed_moves(board)).to contain_exactly [0, 5], [2, 5]
        end
      end

      context 'when is blocked by the pieces of the same color' do
        it "can't move" do 
          board.set_piece(Knight,  :black, [3, 3] )
          board.set_piece(Pawn,    :black, [1, 2] )
          board.set_piece(Pawn,    :black, [1, 4] )
          board.set_piece(Pawn,    :black, [2, 1] )
          board.set_piece(Pawn,    :black, [2, 5] )
          board.set_piece(Pawn,    :black, [4, 1] )
          board.set_piece(Pawn,    :black, [4, 5] )
          board.set_piece(Pawn,    :black, [5, 2] )
          board.set_piece(Pawn,    :black, [5, 4] )
          knight = board.get_piece([3, 3])
          expect(knight.allowed_moves(board)).to eq []
        end
      end

      context 'when surronded by opponents' do
        it "can make 8 moves" do 
          board.set_piece(Knight,  :black, [3, 3] )
          board.set_piece(Pawn,    :white, [1, 2] )
          board.set_piece(Pawn,    :white, [1, 4] )
          board.set_piece(Pawn,    :white, [2, 1] )
          board.set_piece(Pawn,    :white, [2, 5] )
          board.set_piece(Pawn,    :white, [4, 1] )
          board.set_piece(Pawn,    :white, [4, 5] )
          board.set_piece(Pawn,    :white, [5, 2] )
          board.set_piece(Pawn,    :white, [5, 4] )
          knight = board.get_piece([3, 3])
          expect(knight.allowed_moves(board)).to contain_exactly [1, 2], [1, 4], [2, 1], [2, 5],
                                                                 [4, 1], [4, 5], [5, 2], [5, 4]
        end
      end
    end

    describe 'king_moves' do 
      context "when the board is empty" do 

        it 'can move in 8 directions' do 
          king = board.set_piece(King, :black, [3, 3])
          expect(king.allowed_moves(board)).to contain_exactly [2, 2], [3, 2], [4, 2], [2, 3], 
                                                               [4, 3], [2, 4], [3, 4], [4, 4]
        end
      end

      context "when is surranded by opponents" do 
        
        it 'can move in 8 directions' do 
          king = board.set_piece(King, :black, [3, 3])
          expect(king.allowed_moves(board)).to contain_exactly [2, 2], [3, 2], [4, 2], [2, 3], 
                                                               [4, 3], [2, 4], [3, 4], [4, 4]
        end
      end

      context 'in the starting position' do 
        it 'has no moves' do 
          board.arrange_pieces
          king = board.get_piece([4, 0])
          expect(king.allowed_moves(board)).to eq []
        end
      end
    end
  end
end