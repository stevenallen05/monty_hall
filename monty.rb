require "ruby-progressbar"
require "byebug"
INTERVAL = 1_000_000

at_exit do
  # Strategy: always stay
  wins = play_game("Always stay") { |_revealed_goat, picked_door| picked_door }
  print_record(wins)

  # Strategy: always switch
  wins = play_game("Always switch") { |revealed_goat, picked_door| ((0..2).to_a - [revealed_goat, picked_door]).first }
  print_record(wins)
end

def print_record(wins)
  puts "Record: #{(wins.to_f * 100)/ INTERVAL}% (#{wins}/#{INTERVAL})"
end

def reveal_goat(picked_door)
  @doors.each_with_index.map { |k, v| k == "goat" && picked_door != v ? v : nil }.compact.shuffle.first
end

def reset_doors!
  @doors = ["car", "goat", "goat"].shuffle
end

def play_game(strategy, &second_door_choice)
  wins = losses = 0
  progressbar = ProgressBar.create(total: INTERVAL, title: strategy)
  INTERVAL.times do
    reset_doors!
    picked_door = rand(0..2)
    revealed_goat = reveal_goat(picked_door)
    wins += 1 if @doors[second_door_choice.call(revealed_goat, picked_door)] == "car"

    progressbar.increment
  end
  wins
end
