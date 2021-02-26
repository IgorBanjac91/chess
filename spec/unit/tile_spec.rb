require 'spec_helper'

module Chess
  RSpec.describe Tile do 
    
    let(:board) { Board.new }

    describe "#initialzie" do 

      it "sets the column position" do 
        tile = Tile.new( {x: 1} )
        expect(tile.x).to eq(1)
      end
      
      it 'sets the row position' do 
        tile = Tile.new( {y: 1 } ) 
        expect(tile.y).to eq(1)
      end

      it 'is empty by default' do 
        tile = Tile.new()
        expect(tile).to be_empty
      end
    end

    describe "#black_pawn?" do 
       
      before(:each) do 
        board.set_piece(Pawn, :black, [3, 3])
        board.set_piece(Pawn, :white, [2, 2])
      end

      it 'returns true when contente is a black pawn' do 
        tile = board.tile_at([3, 3])
        expect(tile.black_pawn?).to be true
      end
      
      it 'returns false when content is empty' do 
        tile = board.tile_at([0, 0])
        expect(tile.black_pawn?).to be false
      end
      
      it 'returns false when content is a white pawn' do 
        tile = board.tile_at([2, 2])
        expect(tile.black_pawn?).to be false
      end

    end

    describe "#white_pawn?" do 
       
      before(:each) do 
        board.set_piece(Pawn, :black, [3, 3])
        board.set_piece(Pawn, :white, [2, 2])
      end

      it 'returns true when contente is a white pawn' do 
        tile = board.tile_at([2, 2])
        expect(tile.white_pawn?).to be true
      end
      
      it 'returns false when content is empty' do 
        tile = board.tile_at([0, 0])
        expect(tile.white_pawn?).to be false
      end
      
      it 'returns false when content is a black pawn' do 
        tile = board.tile_at([3, 3])
        expect(tile.white_pawn?).to be false
      end

    end
  end
end