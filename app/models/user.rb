class User
  require 'bcrypt'
  include Mongoid::Document

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :session, type: String

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password_digest

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  def password=(password)
    return self.errors[:password_digest] = "must be present."  unless password
    self.password_digest = BCrypt::Password.create(password)
  end

end
