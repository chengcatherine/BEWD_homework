# Catherine Cheng
# Homework - Arrays and Hashes

require 'json'
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

def emails
	puts "Additional emails? Y or N"
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
	entry[:email] = [gets.strip]

	email_response = emails()
	until email_response == "N" do
		puts "Email: "
		entry[:email] << gets.strip
		email_response = emails()
	end 
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


# function to load address_book from disk from a JSON file
def load_book_from_json(filename)
	json_file = File.read(filename)
	return address_book_hash = JSON.parse(json_file, :symbolize_names => true)
end

# function to create a json file from the address_book
def create_json_file(filename, addressbook)
  # Perfect!  Using the block form of File.open ensures
  # that the file is closed properly once you are finished
  # writing to it.
	file = File.open(filename, "w") do |f|
	f.write(addressbook.to_json)
	end
end

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
		            .sort_by! { |a| a[:first_name].downcase }
		            .sort_by! { |a| a[:last_name].downcase }
		puts address_book
	elsif choice == view
		view(address_book)
	elsif choice == delete
		book_size = view(address_book).to_i
		delete_entry = delete(book_size)
		address_book.delete_at(delete_entry)
		book_size = address_book.size.to_i
	else
		puts "So silly! That's not an option!"
	end
	choice = menu()
end


create_json_file("address_book.json", address_book)

### Looks good, but this should probably be called at
### the beginning of the code rather than just before
### the application exits.  I'm guessing that you were
### unsure about how to handle the Exception that could
### occur when the user had not created an address book
### file yet.  Perhaps something like this?
###
###   begin
###     address_book = load_book_from_json('address_book.json')
###   rescue  Errno::ENOENT   # File not found error
###     address_book = []
###   end
load_book_from_json('address_book.json')

exit







