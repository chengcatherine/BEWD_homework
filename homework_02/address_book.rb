# Catherine Cheng
# Homework - Arrays and Hashes

# Start out with an empty address book
address_book = Array.new

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
	address_book.each_with_index do |entry, index|
		puts "#{index} #{entry.fetch(:last_name)}, #{entry.fetch(:first_name)}"
	end
	return address_book.size
end

# delete function prompts user to specify which entry to delete
# if a valid value, the index of the desired entry is returned or else the user is prompted again
def delete(book_size)
	puts "Which entry would you like to delete?"
	delete_entry = gets.to_i
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
		menu()
	end
end

exit






