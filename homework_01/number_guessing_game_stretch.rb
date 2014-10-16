# Catherine Cheng - BEWD Homework_01_strech_goal
# Number Guessing Game Strech Toals Version

status = true
# Program is thinking of a number between range defined by user
while (status)
  print "I'm thinking of a number. Choose the minimum and maximum of this range! "
  print "Minimum: "
  min = gets.to_i
  print "Maximum: "
  max = gets.to_i

  if (min >= max)
    puts "Stop goofing around!"
  end

  prng = Random.new
  number = prng.rand(min..max)

# User given X number of chances to guess the number
  print "How many guesses do you want?"
  chances = gets.to_i

  chances.times do
    print "I'm thinking of a number between 1 and 10. What is your guess?: "
    guess = Integer(gets)
    if (guess == number)
      puts "NAILED IT!!!"
      exit
    elsif (guess < number)
      puts "Too Low!"
    else (guess > number)
      puts "Too High!"
    end
  end
  print "You lose! I win! Womp womp!\nWant to play again?\nyes or no\n"
  response = gets
  puts response.is_a?(String)
  if (response == "no")
    puts "Aw, shucks.."
    status = false
  else
    puts "Hooray!"
    status = true
  end
end
exit

