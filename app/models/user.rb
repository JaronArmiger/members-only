class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	before_save { email.downcase! }

	validates :name,  presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
