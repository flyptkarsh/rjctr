class User < ActiveRecord::Base 
	has_secure_password
	has_many :bestofs, dependent: :destroy 
	validates :username, :alias, presence: true
	validates :username, uniqueness: true 
end