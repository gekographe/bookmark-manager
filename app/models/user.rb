require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  attr_accessor :password_confirmation, :password

  validates_confirmation_of :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) if password
    @password = password
  end


end
