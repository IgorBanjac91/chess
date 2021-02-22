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
      white = players[0]
      black = players[1]
      puts "White starts"
      player = white
      while  true
        if check_to?(player.color)
          if checkmate_to?(player.color)
            "#{opponent} wins!"
            break 
          else
            piece = choose_piece
            until off_check_moves?(piece)
              puts "Choose a valid piece to off check"
              piece = choose_piece
            end
            puts "Move to: "
            make_move(piece)
          end
        else
          puts "#{player.color}, choose a piece: "
          piece = choose_piece(player)
          puts "Move to: "
          make_move(piece)
        end
        player.color == :white ? player == black : player == white
      end
    end

    def valid_move?(piece, pos)
      return true if off_check_move?(piece, pos)
    end
  
    def make_move(piece)
      pos = choose_position
      until valid_move?(piece, pos) && piece.allowed_move?(pos)
        pos = choose_position
      end
      piece.move_to(board, pos)
    end

    def choose_piece(player)
      pos = choose_position
      until valid_piece?(pos, player.color)
        if board.content_at(pos).empty?
          puts "Empty tail, choose a piece: "
          pos = choose_position
        else
          puts "You cannot move an opponent piece, try again: "
          pos = choose_position
        end
      end
      board.get_piece(pos)
    end

    def valid_piece?(pos, player)
      return false if board.content_at(pos).empty?
      piece = board.get_piece(pos)
      return true if piece.color == player.color 
    end
    
    def choose_position
      position = gets.chomp
      until valid_coordinate?(position)
        puts "Invalid input, try again: "
        position = gets.chomp
      end
      algebric_to_num(position)
    end

    def valid_coordinate?(alg_coordinate)
      alg_coordinate.match(/[a-h][1-8]/) ? true : false
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
          return false if off_check_moves?(piece)
        end
      else
        board.black_pieces.each do |piece|
          return false if off_check_moves?(piece)
        end
      end
      true    
    end

    # def valid_move?(moves, pos, color)
    #   moves.include?(pos) && !check_to?(color)
    # end

    def off_check_move?(piece, move)
      sim_game = Game.new
      sim_game.board = Board.new grid: board.grid
      sim_board = sim_game.board
      piece.move_to(sim_board, move)
      sim_game.check_to?(piece.color) ? false : true
    end

    def off_check_moves?(piece)
      piece.allowed_moves(board).each do |move|
        return true if off_check_move?(piece, move)
      end
      false
    end

    private

      def algebric_to_num(string)
        map = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7 }
        x = map[string.chars[0]]
        y = string.chars[1].to_i - 1
        coordinates = [x, y]
      end

  end
end

