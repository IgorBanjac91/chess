require "spec_helper"


module Chess
  RSpec.describe Board do 

    let(:board) { Board.new }

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



  end
end