class Board
  attr_accessor :cups
  attr_reader :name1, :name2, :current_player

  def initialize(name1, name2) # Finished
    # fill all cups except for cup[6] and cup[13] with stones
    @cups = Array.new(14) { [] } 
    place_stones
    @name1 = name1
    @name2 = name2
    @current_player = @name1
  end

  def place_stones # Finished
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      if !(idx == 6 || idx == 13)
        4.times { cups[idx] << :stone }
      end
    end
  end

  def valid_move?(start_pos) # Finished
    raise "Invalid starting cup" if start_pos < 0 || start_pos == 6 || start_pos > 12
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, player_name) # Finished
    
    stones_in_hand = []

    stones_in_hand += cups[start_pos]
    cups[start_pos] = []

    # will rotate this to keep track of which cup is next
    board_pos = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

    (start_pos + 1).times { board_pos.rotate! }

    while !stones_in_hand.empty?

      if (player_name == @name1 && board_pos[0] == 13) || (player_name == @name2 && board_pos[0] == 6)
        board_pos.rotate!
      else
        cups[board_pos[0]] << stones_in_hand.shift
        board_pos.rotate!
      end
    end

    render
    next_turn(board_pos[-1])
  end

  # My Version - fixed it by comparing it to the Solution's
  def next_turn(ending_cup_idx) # Finished
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty? # Finished
    player_1_side = []
    player_2_side = []

    cups.each_with_index do |cup, idx|
      if idx <= 5
        player_1_side += cup
      elsif idx <= 7 && idx <= 12
        player_2_side += cup
      end
    end

    player_1_side.empty? || player_2_side.empty?
  end

  def winner # Finished
    player_1_score = cups[6].count
    player_2_score = cups[13].count

    if player_1_score > player_2_score
      return name1
    elsif player_2_score > player_1_score
      return name2
    else
      return :draw
    end
  end
end
