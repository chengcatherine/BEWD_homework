# Catherine Cheng - BEWD Homework_01
# Number Guessing Game

# Program is thinking of a number between 1 and 10
prng = Random.new
number = prng.rand(1..10)

# User given 5 chances to guess the number
5.times do
  print "I'm thinking of a number between 1 and 10. What is your guess?: "
  guess = gets.to_i
  if (guess == number)
    puts "NAILED IT!!!"
    exit
  elsif (guess < number)
    puts "Too Low!"
  else (guess > number)
    puts "Too High!"
  end
end
puts "You lose! I win! Womp womp!"
exit

