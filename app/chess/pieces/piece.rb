module Chess
  class Piece
    attr_accessor :color, :position
    def initialize(input = {})
      @color = input.fetch(:color)
      @position = input.fetch(:position, [0, 0])    
    end
  end
end