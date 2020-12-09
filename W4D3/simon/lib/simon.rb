# To Play - Run this File in Terminal

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize # Finished
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play # Finished
    while !game_over
      take_turn
    end

    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn # Finished
    show_sequence
    user_attempt = require_sequence

    if @seq != user_attempt
      @game_over = true
    end

    round_success_message
    @sequence_length += 1
  end

  def show_sequence # Finished
    add_random_color
    p @seq
    sleep(2)
    system("clear")
  end

  def require_sequence # Read Instructions to do this
    puts "Please enter the colors that were shown in order, separated by a space in between each color"
    user_attempt = gets.chomp.split(" ")
    return user_attempt
  end

  def add_random_color # Finished
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Yay! You survived another round!" if !@game_over
  end

  def game_over_message
    puts "Game Over. Nice try, buddy. Better luck next time!"
  end

  def reset_game # Finished
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

# To Play - run this File in Terminal
game = Simon.new
game.play
