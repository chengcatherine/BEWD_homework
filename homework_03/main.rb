require 'active_record'
require 'pry'

require_relative 'lib/models'
require_relative 'lib/connect'


def menu
	puts "Select an option:"
	puts "\t(1) Create new entry"
	puts "\t(2) Search for entries"
	puts "\t(3) Quit Application"
	return gets.strip.to_i
end

def ask_delete
	puts "Do you want to delete these entries? (Y/N)"
	response = gets.strip
	return response
end

def delete_entry(entries)
	entries.each do |e|
		e.destroy
	end
end

# creates an email entry for a particular address entry
def email
	puts "Email category (ex: Work, Personal): "
	type = gets.strip
	puts "Email address: "
	email = gets.strip

	email_entry = EmailAddress.new(
		address: email, 
		category: type
	)
	return email_entry
end

# creates a phone number entry for a particular address entry
def phone
	puts "Phone number category (ex: Home, Cell): "
	type = gets.strip
	puts "Phone number digits: "
	num = gets.strip
	phone_entry = PhoneNumber.new(
		category: type,
		digits: num
	)
	return phone_entry
end

# CREATE_ENTRY METHOD - creates address entries (includes digits and emails)
def create_entry
	# Creates a new entry in address_entries
	# Requests first and last name from user
	puts "Adding a new entry. Please enter the following information.\n"
	puts "First Name: "
	first = gets.strip
	puts "Last Name: "
	last = gets.strip
	a = AddressEntry.create(
		first_name: first, 
		last_name: last
	)
	# Obtains phone numbers for that entry
	# Users have the option of entering multiple numbers
	puts "Add a phone number? (Y/N): "
	phone_response = gets.strip
	until phone_response == "N" do 
		p = phone()
		a.phone_numbers.to_a
		a.phone_numbers.push p 
		puts "Add another phone number? (Y/N): "
		phone_response = gets.strip
	end
	# Obtains email addresses for that entry
	# Users have the option of entering multiple emails
	puts "Add an email? (Y/N): "
	email_response = gets.strip
	until email_response == "N" do
		e = email()
		a.email_addresses.to_a
		# Do I need to make it an array first?
		a.email_addresses.push e 
		puts "Add another email? (Y/N): "
		email_response = gets.strip
	end

	a.save!
	puts "Woohoo! AddressEntry has been saved!"
end


def search_first_name
	puts "Searching for entries by first name."
	puts "Search: "
	search_string = gets.strip
	puts

	@results = AddressEntry.where(
		first_name: search_string
		)
	puts "Found #{@results.size()} matches!"
	puts
	@results.each do |c|
		puts "First name:\t\t#{c.first_name}"
		puts "Last name:\t\t#{c.last_name}"
		@emails = c.email_addresses
		puts "Emails: "
		@emails.each do |e|
			puts e.address + "\t\t#{e.category}"
		end
		@phone_nums = c.phone_numbers
		puts "Phone Numbers: "
		@phone_nums.each do |p|
			puts p.digits + "\t\t#{p.category}"
		end
		puts
	end
	puts
	if ask_delete == "Y"
		delete_entry(@results)
	end
end


# SEARCH_ENTRY METHOD - searches by last name
def search_last_name
	puts "Searching for entries by last name."
	puts "Search: "
	search_string = gets.strip
	puts

	@results = AddressEntry.where(
		last_name: search_string
		)
	puts "Found #{@results.size()} matches!"
	puts
	@results.each do |c|
		puts "First name:\t\t#{c.first_name}"
		puts "Last name:\t\t#{c.last_name}"
		@emails = c.email_addresses
		puts "Emails: "
		@emails.each do |e|
			puts e.address + "\t\t#{e.category}"
		end
		@phone_nums = c.phone_numbers
		puts "Phone Numbers: "
		@phone_nums.each do |p|
			puts p.digits + "\t\t#{p.category}"
		end
		puts
	end
	puts
	if ask_delete == "Y"
		delete_entry(@results)
	end
end

def search_email
	puts "Searching for entries by email."
	puts "Search: "
	search_string = gets.strip
	puts

	@results = EmailAddress.where(
		address: search_string
	)
	puts "Found #{@results.size()} matches!"
	@results.each do |e| 
		a = AddressEntry.find(e.address_entry_id)
		puts "First name:\t\t#{a.first_name}"
		puts "Last name:\t\t#{a.last_name}"
		e.address
		@phone_nums = a.phone_numbers
		puts "Phone Numbers: "
		@phone_nums.each do |p|
			puts p.digits + "\t\t#{p.category}"
		end
		puts
	end
	puts
end


def search_entry
	puts "What would you like to search by?"
	puts "\t(1) Last Name"
	puts "\t(2) First Name"
	puts "\t(3) Email Address"
	search_choice = gets.strip.to_i
	if search_choice == 1
		search_last_name
	elsif search_choice == 2
		search_first_name
	else
		search_email
	end
end



# EXIT METHOD - exists application
def exit
	num_entries = AddressEntry.last['id']
	puts "Don't worry! We've saved all #{num_entries} address book entries in your database."
	puts "BYE!"
	exit 
end


menu_choice = menu()
until menu_choice == 3 do
	if menu_choice == 1
		create_entry
	else menu_choice == 2
		search_entry
	end
	menu_choice = menu()
end
