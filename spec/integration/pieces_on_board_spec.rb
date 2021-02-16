require "spec_helper"


module Chess
  RSpec.describe "pieces position on board" do 
  
    
    context "when the game starts"  do 

      before(:each) do 
        game = Game.new
        game.play
        @board_grid = game.board.grid
      end

      describe 'pieces on baord' do 
        it 'has all the black pawns on the seventh row' do 
          @board_grid.each do |col|
            piece = col[6].content
            expect(piece).to be_a(Pawn)
            expect(piece.color).to eq(:black)
          end
        end
        
        it 'has all white pawns on the second row' do 
          @board_grid.each do |col|
            piece = col[1].content
            expect(piece).to be_a(Pawn)
            expect(piece.color).to eq(:white)
          end
        end
      end
    end
  end
end