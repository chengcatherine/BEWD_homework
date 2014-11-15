require 'active_record'
require 'pry'

require_relative 'models'
require_relative 'connect'

# binding.pry

def menu
	puts "Select an option:\n
	(1) Create new entry\n 
	(2) Search for entries\n 
	(3) Quit Application\n"
	return gets.strip
end



def create_entry
	puts "You are adding a new entry. Please enter the following information\n"
	puts "First Name: "
	first = gets.strip
	puts "Last Name: "
	last = gets.strip
	entry = AddressEntry.new({first_name: first, last_name: last})
	entry.save!
end

def email
	puts "How many email addresses?"
	num_email = gets.strip.to_i
	num_email.times do
		puts "Email: "
		email = gets.strip
	end
end



create = "1"
search = "2"
quit = "3"

if menu() == create
	create_entry
end


# while user does not choose to quit, the user continues to be prompted to choose a new option
# choice = menu()
# until choice == quit do
# 	if choice == create
# 		new_entry = create()
# 		address_book.push(new_entry)
# 		            .sort_by! { |a| a[:first_name].downcase }
# 		            .sort_by! { |a| a[:last_name].downcase }
# 		puts address_book
# 	elsif choice == view
# 		view(address_book)
# 	elsif choice == delete
# 		book_size = view(address_book).to_i
# 		delete_entry = delete(book_size)
# 		address_book.delete_at(delete_entry)
# 		book_size = address_book.size.to_i
# 	else
# 		puts "Stop it! Enter 1, 2, or 3 for a valid selection."
# 	end
# 	choice = menu()
# end