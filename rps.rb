# 1. All players pick either Rock, Paper, or Scissors.
# 2. Compare: rock > scissors, scissors > paper, paper > rock, or tie if same.
# 3. play again?

CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
puts "Welcome to Rock, Paper, Scissors"

def display_message(winning_choice, outcome)
  case winning_choice
  when 'r'
    result = "Rock smashes Scissors!"
  when 'p'
    result = "Paper wraps Rock!"
  when 's'
    result = "Scissors cuts Paper!"
  end

  case outcome
  when 0
    puts "It's a tie!"
  when 1
    puts result + " You win!"
  when 2
    puts result + " You lose!"
  end
end

loop do 
  # player makes a pick
  begin
    puts "Pick one: (r, p, s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    display_message(player_choice, 0)
  elsif (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p') || (player_choice == 'p' && computer_choice == 'r')
    display_message(player_choice, 1)
  else
    display_message(computer_choice, 2)
  end

  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'
end

puts "Good bye!"