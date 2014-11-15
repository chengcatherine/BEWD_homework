require 'active_record'

class AddressEntry < ActiveRecord::Base
	has_many :email_addresses
	has_many :phone_numbers
end
