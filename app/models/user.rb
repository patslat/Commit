class User
  include Mongoid::Document

  field :username, type: String
  field :email, type: String
  field :session_token, type: String
  field :password_digest, type: String

  attr_protected :password_digest

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password_digest

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  after_initialize :ensure_session_token

  def self.find_by_credentials(credentials)
    user = User.where(username: credentials[:username]).first
    user.is_password?(credentials.delete :password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end


  def password=(password)
    return self.errors[:password_digest] = "must be present." unless password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest.clone) == (password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
