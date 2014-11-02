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

  # Hmm... so, you detect that the user entered the
  # range out of order, but then they are never asked
  # to fix the values.  This will cause rand(min...max)
  # to return  nil  later on.
  #
  # Based upon what you know now, how would you force the
  # user to keep entering values until they choose values
  # that are in the correct order?
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

      # If the user guesses the correct value, then the program
      # will exit.  That is, they are not given the option to
      # play again.  Instead of using an 'exit' statement here,
      # consider:
      #
      #  1. Placing the 'changes.times' loop into a separate method
      #  2. Using a 'return' statement to exit the method (rather
      #     then using an 'exit' statement to exit the program)
      exit
    elsif (guess < number)
      puts "Too Low!"
    else (guess > number)
      puts "Too High!"
    end
  end
  print "You lose! I win! Womp womp!\nWant to play again?\nyes or no\n"

  # Oops!  It looks like you forgot to call '.chomp()' to remove
  # the newline character from the end of the user's input.
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

