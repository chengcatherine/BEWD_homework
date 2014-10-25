# Catherine Cheng
# Homework - Arrays and Hashes

address_book = Array.new

def menu
	puts "Select an option:\n
	Create new entry\n 
	View existing entry\n 
	Delete existing entry\n 
	Quit Application\n"
	return gets.strip
end

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

def view
	puts "view choice"

end

def delete
	puts "delete"
end

def quit
	exit
end



create = "Create new entry"
view = "View existing entry"
delete = "Delete existing entry"
quit = "Quit Application"



# while choice is not quit, continue to run menu
choice = menu()

if choice == create
	address_book.push(create())
	menu()
elsif choice == view
	address_book.each_with_index do |entry, index|
		puts "#{index} entry.fetch(:last_name), entry.fetch(:first_name)"
	end
elsif choice == delete
	delete()
elsif choice == quit
	quit()
else
	puts "So silly! That's not an option!"
	menu()
end





