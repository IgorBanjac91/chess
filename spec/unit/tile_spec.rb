require 'spec_helper'

module Chess
  RSpec.describe Tile do 
    
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
  end
end