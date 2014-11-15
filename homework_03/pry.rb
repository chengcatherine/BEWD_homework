
####################################################
# This script connects to the database, loads the
# models, and drops you into a PRY console.
####################################################


require 'pry'

# Connect to the database
require_relative 'lib/connect'

# Load the models so that they'll be available
# to the PRY console.
require_relative 'lib/models'


# Finally, launch the PRY console.
binding.pry