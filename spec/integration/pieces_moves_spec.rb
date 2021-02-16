require 'spec_helper'

module Chess
  RSpec.describe 'move pieces on board' do 
    describe 'pawn moves' do 

      let (:white_pawn) { Pawn.new( { color: :white } )}
      let (:white_pawn_2) { Pawn.new( { color: :white } )}
      let (:black_pawn) { Pawn.new( { color: :black } )}
      let (:black_pawn_2) { Pawn.new( { color: :black } )}
      let (:board) { Board.new } # Empty board

      context "when the pawn is white" do 
        context "in the starting position" do 
          it 'can move one or two step forward' do 
            white_pawn.position = [2, 1]
            moves = white_pawn.allowed_moves(board)
            expect(moves).to eq [[2, 3], [2, 2]]
          end
        end

        context "when ther is a pice in the front" do 
          it 'has no moves' do 
            white_pawn.position = [2, 1]
            black_pawn.position = [2, 2]
            board.grid[2][2].content = black_pawn
            moves = white_pawn.allowed_moves(board)
            expect(moves).to eq []
          end
        end
        
        context "when there are pieces in front-diagonally" do 
          it 'can move that way' do 
            white_pawn.position = [2, 1]
            black_pawn.position = [3, 2]
            board.grid[3][2].content = black_pawn
            black_pawn_2.position = [1, 2]
            board.grid[1][2].content = black_pawn_2
            moves = white_pawn.allowed_moves(board)
            expect(moves).to contain_exactly [2, 3], [2, 2], [1, 2], [3, 2]
          end
        end
        context "when there are pieces in front-diagonally" do 
          it 'can move that way' do 
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
      
      context "when the pawn is black" do 
        context "in the starting position" do 
          it 'can move one or two step forward' do 
            black_pawn.position = [2, 6]
            moves = black_pawn.allowed_moves(board)
            expect(moves).to eq [[2, 4], [2, 5]]
          end
        end
        
        context "when ther is a pice in the front" do 
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
  end
end