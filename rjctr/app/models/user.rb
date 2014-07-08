class User < ActiveRecord::Base 
	has_secure_password 
	validates :username, :alias, presence: true
	validates :username, uniqueness: true 
end