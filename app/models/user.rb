class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

# def password=(value)
#   @password = value
#   select.password.digest = @password.reverse
# end

# def password
#   @password
# end

# def valid_passwoord?(curren_password)
#   curren_password.reverse ==password.digest  
# end

def image_url_or_default
      image_url.presence || "http://file.vforum.vn/hinh/2016/08/hinh-anh-dep-ve-cho-pug-cute-7.jpg"
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

  def is_friend?(another)
    friends.include?(another)
  end

  def add_friend(another)
      friends << another
  end
  

  def remove_friend(another)
    friendships.find_by(friend_id: another.id).destroy
  end
end  