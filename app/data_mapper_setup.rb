require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tag'
require_relative 'models/link'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}") # Set up a connection to the database
DataMapper.finalize # Check everything we wrote in the model (class) was OK
DataMapper.auto_upgrade! # Let's build any new columns or tables added
