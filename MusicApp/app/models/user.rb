class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true

  before_validation :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    @session_token ||= User.generate_session_token
  end

  #TODO does this work?
  def reset_session_token!
    @session_token = User.generate_session_token
    self.save
  end


end
