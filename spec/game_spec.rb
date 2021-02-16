require 'spec_helper'


module Chess
  RSpec.describe Game do 

    let(:game) { Game.new }

    describe "#players" do 
      it 'has two players' do 
        expect(game.players.count).to eq(2)
      end

      it 'has a white first player' do 
        first_player = game.players[0]
        expect(first_player.color).to eq(:white)
      end

      it 'has a black second player' do 
        second_player = game.players[1]
        expect(second_player.color).to eq(:black)
      end
    end

    it 'has a board' do 
      expect(game.board).to be_a(Board)
    end
    
    describe '#choose_piece' do 
      before(:each) do 
        game.play
      end
      context 'when the game starts' do 
        it 'returns a white pawn on c2' do 
          piece = game.choose_piece('c2')
          expect(piece).to be_a(Pawn)
          expect(piece.color).to eq(:white)
          expect(piece.position).to eq([2, 1])
        end
        
        it 'returns a black pawn on c7' do 
          piece = game.choose_piece('c7')
          expect(piece).to be_a(Pawn)
          expect(piece.color).to eq(:black)
          expect(piece.position).to eq([2, 6])
        end
      end
    end

  end
end