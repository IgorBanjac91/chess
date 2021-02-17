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
    context 'when there is a piece' do 
      it 'returns the piece' do 
        
      end
    end

    context 'whein there is no piece' do 
      it 'returns nil' do 
        
      end
    end

  end
end