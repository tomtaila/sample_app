class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates(:name, length: {maximum: 70}, presence: true)
	validates(:email, length: {maximum:200}, presence: true)
	validates(:email, uniqueness: true, format: {with: VALID_EMAIL_REGEX}) 
	validates(:password, length: {minimum: 6}, presence: true, confirmation: true)

	has_secure_password
end
