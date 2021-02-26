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
            "Checkmate to #{player.color}"
            "#{opponent} wins!"
            break 
          else
            board.display
            puts "#{player.color}, you're under check!! " 
            puts "#{player.color}, choose a piece: "
            piece = choose_piece(player)
            until off_check_moves?(piece)
              puts "Choose a valid piece to off check"
              board.display
              piece = choose_piece
            end
            puts "Move to: "
            make_move(piece)
          end
        else
          board.display
          puts "#{player.color}, choose a piece: "
          piece = choose_piece(player)
          puts "Move to: "
          make_move(piece)
        end
        player.color == :white ? player = black : player = white
      end
    end
  
    def make_move(piece)
      pos = choose_position
      until  piece.allowed_moves(board).include?(pos) && off_check_move?(piece, pos)
        puts "Invalid move, try again.."
        pos = choose_position
      end
      piece.move_to(board, pos)
    end

    def choose_piece(player)
      pos = choose_position
      until valid_piece?(pos, player)
        piece = board.get_piece(pos)
        if board.tile_at(pos).empty?
          puts "Empty tail"
        elsif piece.allowed_moves(board) == []
          puts "Pice has no moves"
        else
          puts "You cannot move an opponent piece, try again: "
        end
        puts "Choose a valid piece: "
        pos = choose_position
      end
      board.get_piece(pos)
    end

    def valid_piece?(pos, player)
      return false if board.tile_at(pos).empty? 
      piece = board.get_piece(pos) 
      return true if piece.color == player.color && piece.allowed_moves(board) != []
      false
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

    def off_check_move?(piece, move)
      opponent = nil
      old_x, old_y = piece.position[0], piece.position[1]
      new_x, new_y = move[0], move[1]
      unless board.tile_at([new_x, new_y]).empty?
        opponent = board.get_piece([new_x, new_y])
      end
      piece.move_to(board, move)
      if check_to?(piece.color)
        piece.move_to(board, [old_x, old_y])
        board.grid[new_x][new_y].content = opponent unless opponent == nil 
        return false
      else
        piece.move_to(board, [old_x, old_y])
        board.grid[new_x][new_y].content = opponent unless opponent == nil 
        return true
      end

    end

    def off_check_moves?(piece)
      piece.allowed_moves(board).each do |move|
        return true if off_check_move?(piece, move)
      end
      false
    end

    def opponent(player)
      player.color == :white ? "Black" : "White"
    end
    
    def pawns_at_opposite_edge?
      board.grid.each do |col|
        return true if col[0].black_pawn? || col[7].white_pawn?
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

