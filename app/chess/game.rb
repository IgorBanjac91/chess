module Chess
  class Game
    attr_reader :players, :board
    def initialize()
      @players = [Player.new(color: :white), Player.new(color: :black)]
      @board = Board.new
    end

    def play
      board.arrange_pieces
      whties = players[0]
      blacks = players[1]
      until game_over?
        # whties
        piece = choose_piece(pos)
        


      end
      
    end

    def choose_piece
      puts 'Choose a piece: '
      pos = gets.chomp
      coordinates = algebric_to_xy(pos)
      x = coordinates[0]
      y = coordinates[1]
      tile = board.grid[x][y]
      contenet = tile.content
    end

    def valid_pice?

    end

    private

      def algebric_to_xy(string)
        map = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7 }
        x = map[string.chars[0]]
        y = string.chars[1].to_i - 1
        coordinates = [x, y]
      end
  end
end

