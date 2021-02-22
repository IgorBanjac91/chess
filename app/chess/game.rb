module Chess
  class Game
    attr_accessor :board
    attr_reader :players
    def initialize(input = {})
      @players = [Player.new(color: :white), Player.new(color: :black)]
      @board = input.fetch(:board, Board.new)
    end

    def play
      board.arrange_pieces
      # whites = players[0]
      # blacks = players[1]
      # until game_over?
      #   puts "White"
      #   puts "Choose a piece: "
      #   alg_coordinates = gets.chomp
      #   num_coordinates = algebric_to_num(alg_coordinates)
      #   # check if they are valid
      #   piece = board.get_piece(num_coordinates)
      #   # check if its a valid piece
      #   puts "Move to:  "
      #   pos = gets.chomp
      #   moves = piece.allowed_moves(board)
      #   # check if its a valid move
      #   # it should not put you in check
      #   if valid_move?(moves, pos)
      #     board.set_piece(piece.class, piece.color, pos)
      #   else
      #     #try again
      #   end
        
      #   if check_to?(:black)
      #     if checkmate_to?(:black)
      #       break
      #     end
      #   else 
      #     # black player need to make a move for
      #     # excaping the check
      

        


      # end
      
    end

    def check_to?(color)
      if color == :white
        return true if board.black_pieces_moves.include?(board.get_king(:white).position)  
      else
        return true if board.white_pieces_moves.include?(board.get_king(:black).position)
      end
      false
    end

    def checkmate_to?(color)
      if color == :white  
        board.white_pieces.each do |piece|
          piece.allowed_moves(board).each do |move|
            sim_game = Game.new
            sim_game.board = Board.new grid: board.grid
            sim_board = sim_game.board
            piece.move_to(sim_board, move)
            return false unless sim_game.check_to?(color)
            sim_game = nil
          end
        end
      else
        board.black_pieces.each do |piece|
          piece.allowed_moves(board).each do |move|
            sim_game = Game.new
            sim_board = Board.new grid: board.grid
            sim_board = sim_game.board
            piece.move_to(sim_board, move)
            return false unless sim_game.check_to?(color)
            sim_board = nil
          end
        end
      end
      true    
    end

    def valid_move?(moves, pos, color)
      moves.include?(pos) && !check_to?(color)
    end

    def choose_piece
      puts 'Choose a piece: '
      pos = gets.chomp
      coordinates = algebric_to_num(pos)
      x = coordinates[0]
      y = coordinates[1]
      tile = board.grid[x][y]
      contenet = tile.content
    end

    private

      def algebric_to_num(string)
        map = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7 }
        x = map[string.chars[0]]
        y = string.chars[1].to_i - 1
        coordinates = [x, y]
      end

      def game_over?
        true if checkmate?
      end
  end
end

