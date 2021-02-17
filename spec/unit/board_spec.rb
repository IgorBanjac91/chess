require "spec_helper"


module Chess
  RSpec.describe Board do 

    let(:board) { Board.new }

    describe '#arrange_pieces' do 

      before(:each) do 
        board.arrange_pieces
      end

      it 'sets the white pawns on the second row' do
        board.grid.each_with_index do |col, index|
          position = [index, 1]
          expect(board.white_piece?(position)).to be true
          expect(board.get_piece(position)).to be_a(Pawn)
        end
      end
      
      it 'sets the black pawns on the seventh row' do
        board.grid.each_with_index do |col, index|
          position = [index, 6]
          expect(board.black_piece?(position)).to be true
          expect(board.get_piece(position)).to be_a(Pawn)
        end
      end

      it 'sets the black rooks' do 
        expect(board.get_piece([0, 7])).to be_a(Rook)
        expect(board.black_piece?([0, 7])).to be true
        expect(board.get_piece([7, 7])).to be_a(Rook)
        expect(board.black_piece?([7, 7])).to be true
      end
      
      it 'sets the white rooks' do 
        expect(board.get_piece([0, 0])).to be_a(Rook)
        expect(board.white_piece?([0, 0])).to be true
        expect(board.get_piece([7, 0])).to be_a(Rook)
        expect(board.white_piece?([7, 0])).to be true
      end

      it 'sets the black bishps' do 
        expect(board.get_piece([2, 7])).to be_a(Bishop)
        expect(board.black_piece?([2, 7])).to be true
        expect(board.get_piece([5, 7])).to be_a(Bishop)
        expect(board.black_piece?([5, 7])).to be true
      end
      
      it 'sets the white bishps'do 
        expect(board.get_piece([2, 0])).to be_a(Bishop)
        expect(board.white_piece?([2, 0])).to be true
        expect(board.get_piece([5, 0])).to be_a(Bishop)
        expect(board.white_piece?([5, 0])).to be true  
      end
      
      it 'sets the black knights' do 
        expect(board.get_piece([1, 7])).to be_a(Knight)
        expect(board.black_piece?([1, 7])).to be true
        expect(board.get_piece([6, 7])).to be_a(Knight)
        expect(board.black_piece?([6, 7])).to be true
      end
      
      it 'sets the white knights' do 
        expect(board.get_piece([1, 0])).to be_a(Knight)
        expect(board.white_piece?([1, 0])).to be true
        expect(board.get_piece([6, 0])).to be_a(Knight)
        expect(board.white_piece?([6, 0])).to be true  
      end
      
      it 'sets the white and black kings' do
        expect(board.get_piece([4, 7])).to be_a(King)
        expect(board.black_piece?([4, 7])).to be true
        expect(board.get_piece([4, 0])).to be_a(King)
        expect(board.white_piece?([4, 0])).to be true  
      end
      
      it 'sets the white and black queens' do 
        expect(board.get_piece([3, 7])).to be_a(Queen)
        expect(board.black_piece?([3, 7])).to be true
        expect(board.get_piece([3, 0])).to be_a(Queen)
        expect(board.white_piece?([3, 0])).to be true  
      end

    end

    describe "#grid" do 

      it 'has 8 rows' do 
        expect(board.grid.count).to eq(8) 
      end

      it 'has 8 tails for each row' do 
        board.grid.each do |row|
          expect(row.count).to eq(8)
          expect(row).to all( be_a(Tile))
        end
      end
    end
    
    describe "#black_piece?" do 
      
      before(:each) do 
        board.arrange_pieces
      end

      it 'return true when the coordinates point to a black piece' do 
        expect(board.black_piece?([1, 6])).to be true
      end
      
      it 'return false when the coordinates point to a white piece' do 
        expect(board.black_piece?([1, 1])).to be false
      end
      
      it 'return false when the coordinates point to an empty tail' do 
        expect(board.black_piece?([4, 5])).to be false
      end
      
    end
    
    describe "#white_piece?" do

      before(:each) do 
        board.arrange_pieces
      end
      
      it 'return true when the coordinates point to a white piece' do 
        expect(board.white_piece?([1, 1])).to be true
      end
      
      it 'return false when the coordinates point to an empty tail' do 
        expect(board.white_piece?([4, 5])).to be false
      end
      
      it 'return false when the coordinates point to a black piece' do 
        expect(board.white_piece?([1, 6])).to be false
      end

    end

    describe "#set_piece" do
      
      it 'sets a piece on the board' do 
        board.set_piece(Pawn, :white, [2, 2])
        expect(board.white_piece?([2, 2])).to be true
      end

    end

  end
end