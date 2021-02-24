require 'spec_helper' 

module Chess
  RSpec.describe Pawn do 
  
    describe '#initialize' do 
      context 'with no arguments' do 
        it 'raises an exeptions' do 
          expect { Pawn.new }.to raise_exception
        end
      end

      context 'with valid arguments' do 

        it 'creates a white pawn'do 
          pawn = Pawn.new( { color: :white } )
          expect(pawn.color).to eq :white
        end

        it 'creates a black pawn'do 
          pawn = Pawn.new( { color: :black } )
          expect(pawn.color).to eq :black
        end

        it 'creates a black pawn on the given position' do 
          pawn = Pawn.new( { color: :black, position: [1, 5] } )
          expect(pawn.position).to eq [1, 5]
        end
      end
    end

    describe '#move_to' do 
      it 'moves more than one time' do 
        board = Board.new
        board.arrange_pieces
        pawn = board.get_piece([0, 1])
        pawn.move_to(board, [0, 2])
        pawn = board.get_piece([0, 2])
        pawn.move_to(board, [0, 3])
        expect(board.tile_at([0, 3])).to_not be_empty
      end
    end
  end
end