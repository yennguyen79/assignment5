class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true

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

def image_url_or_default
      image_url.presence || "http://wallpaper-gallery.net/images/image/image-13.jpg"
end

def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end
end  