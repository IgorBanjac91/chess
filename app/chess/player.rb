module Chess
  class Player
    attr_reader :color
    def initialize(input)
      @color = input.fetch(:color)
    end
  end
end