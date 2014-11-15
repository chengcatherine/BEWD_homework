require 'active_record'

class EmailAddress < ActiveRecord::Base
	
	belongs_to :address_entry
end
