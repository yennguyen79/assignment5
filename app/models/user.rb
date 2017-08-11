class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end

def password=(value)
  @password = value
  sele.password.digest = @password.reverse
end

def password
  @password
end

def valid_passwoord?(curren_password)
  curren_password.reverse ==password.digest  
end