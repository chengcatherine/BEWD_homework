# Catherine Cheng
# Homework - Arrays and Hashes

# Start out with an empty address book
address_book = Array.new

### Nice!  It looks like you have a handle on methods now!
# menu function outputs user options and expects 1, 2, 3, or 4
def menu
	puts "Select an option:\n
	(1) Create new entry\n 
	(2) View existing entry\n 
	(3) Delete existing entry\n 
	(4) Quit Application\n"
	return gets.strip
end

# create function prompts user to input information into a hash called entry
def create
	entry = {}
	puts "You are adding a new entry. Please enter the following information\n"
	puts "First Name: "
  ### Exactly!  There's no need for a temporary first_name
  ### variable when you can just assign directly into the Hash.
	entry[:first_name] = gets.strip
	puts "Last Name: "
	entry[:last_name] = gets.strip
	puts "Phone Number: "
	entry[:phone_number] = gets.strip
	puts "Email: "
	entry[:email] = gets.strip
	# address_book.push(entry)
	return entry
end

# view function prints the index of each hash 
# and prints the first two key value pairs of each hash
# view function returns the size of the address_book
def view(address_book)
	puts "Address Book"

  ### Good use of following Ruby idioms by calling
  ### each_with_index instead of using a while loop.
	address_book.each_with_index do |entry, index|
		puts "#{index} #{entry.fetch(:last_name)}, #{entry.fetch(:first_name)}"
	end

  ### Ut ohz -- you forgot to provide the user with the
  ### opportunity to view the complete details of one
  ### of the entries.  How would you go back and do that?

	return address_book.size
end

# delete function prompts user to specify which entry to delete
# if a valid value, the index of the desired entry is returned or else the user is prompted again
def delete(book_size)
	puts "Which entry would you like to delete?"
	delete_entry = gets.to_i

  ### What if delete_entry < 0 ?
	if delete_entry <= book_size - 1
		return delete_entry
	else
		puts "Stop it! Make sure you enter a valid entry number to delete."
		delete(book_size)
	end
end

# def quit
# 	exit
# end


### Good idea!  Defining these here will make the code
### more readable later on.  Based upon what you learned
### last week, can you think of a better way to do this
### rather than using instance variables?
create = "1"
view = "2"
delete = "3"
quit = "4"



# while user does not choose to quit, the user continues to be prompted to choose a new option
choice = menu()
until choice == quit do
	if choice == create
		new_entry = create()
		address_book.push(new_entry)
		choice = menu()
	elsif choice == view
		view(address_book)
		choice = menu()
	elsif choice == delete
		book_size = view(address_book).to_i
		delete_entry = delete(book_size)
		address_book.delete_at(delete_entry)
		book_size = address_book.size.to_i
		choice = menu()
	else
		puts "So silly! That's not an option!"

    ### Oops!  You forgot to assign this value into 'choice'.
    ### Now users will be stuck in a bizarre infinite loop.
		menu()
	end

  ### I think we already discussed this, but: notice that
  ### each branch in your conditional ends by calling the
  ### 'menu' method again?  This means that the statement
  ### can be removed from each branch and called after
  ### the conditional instead.
end

exit






