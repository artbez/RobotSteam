class User < ActiveRecord::Base

	before_save { self.login = login.downcase }
	before_create :create_remember_token

	has_many :orders
	has_many :robots
	validates :login, presence: true
	validates :password, presence: true
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
