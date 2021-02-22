require 'spec_helper'


module Chess
  RSpec.describe Game do 

    let(:game) { Game.new }
    let(:board) { game.board}

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
    
    describe '#check_to' do 

      context "for the whites" do 

        it 'returns true if king in check' do 
          board.set_piece(King,   :white, [3, 3])
          board.set_piece(Bishop, :black, [5, 5])
          expect(game.check_to?(:white)).to be true
        end
        
        it 'returns false if king is not in check' do # Scenario 0
          board.set_piece(King,   :white, [4, 3])
          board.set_piece(Bishop, :black, [5, 5])
          expect(game.check_to?(:white)).to be false
        end
      end

      it 'returns false if king is not in check' do # Scenario 1
        board.set_piece(King,   :white, [6, 0])
        board.set_piece(King,   :black, [4, 1])
        board.set_piece(Knight, :black, [7, 3])
        expect(game.check_to?(:white)).to be false
      end
      it 'returns false if king is not in check' do # Scenario 2
        board.arrange_pieces
        expect(game.check_to?(:white)).to be false
      end
      
      context "for the blacks" do 
        
        it "returns ture if king in check" do 
          board.set_piece(King,   :black, [3, 3])
          board.set_piece(Bishop, :white, [5, 5])
          expect(game.check_to?(:black)).to be true
        end

        it 'returns false if king is not in check' do 
          board.set_piece(King,   :black, [4, 3])
          board.set_piece(Bishop, :white, [5, 5])
          expect(game.check_to?(:black)).to be false
        end
      end
    end

    describe '#checkmate_to?' do 

      context "when the checkmate is on white" do 

        it 'returns true if king in chekmate' do 
          board.set_piece(King,   :white, [6, 0])
          board.set_piece(Rook,   :black, [0, 0])
          board.set_piece(King,   :black, [4, 1])
          board.set_piece(Knight, :black, [7, 3])
          board.set_piece(Knight, :black, [5, 2])
          expect(game.checkmate_to?(:white)).to be true
        end

        it "returns false if king isn't in checkmate" do 
          board.set_piece(King,   :white, [6, 0])
          board.set_piece(Rook,   :black, [0, 0])
          board.set_piece(King,   :black, [4, 1])
          board.set_piece(Knight, :black, [7, 3])
          expect(game.checkmate_to?(:white)).to be false
        end

      end
    end
  end
end