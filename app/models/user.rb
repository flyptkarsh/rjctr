class User < ActiveRecord::Base 
	has_secure_password
	has_many :bestofs, dependent: :destroy 
	validates_presence_of :username, :alias
	validates_uniqueness_of :username
end