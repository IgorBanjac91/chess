require 'spec_helper'

module Chess
  RSpec.describe Player do 
    context "have two valid colors" do 
      it 'can be white' do 
        player = Player.new(color: :white)
        expect(player.color).to be(:white)
      end
  
      it 'can be black' do 
        player = Player.new(color: :black)
        expect(player.color).to be(:black)
      end
    end
  end
end