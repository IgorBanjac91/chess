module Chess
  class Tile
    attr_accessor :x, :y, :content
    def initialize(input = {})
      @x = input.fetch(:x, 0)
      @y = input.fetch(:y, 0)
      @content = input.fetch(:content, " ")
    end

    def empty?
      return true if content == " "
    end

    def black_pawn?
      if content.instance_of?(Pawn)
        return true if content.color == :black 
      end
      false
    end

    def white_pawn?
      if content.instance_of?(Pawn)
        return true if content.color == :white 
      end
      false
    end



  end
end