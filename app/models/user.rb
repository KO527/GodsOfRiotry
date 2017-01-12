class User < ActiveRecord::Base

	attr_accessor :remember_token

	before_save {self.email = email.downcase}
	
	has_many :favorited_events, through: :preferences
	has_many :favorited_songs, through: :songs
	has_many :favorited_events, through: :preferences
	has_many :preferences
	has_many :favorited_outfits, through: :preferences
	has_many :favorited_artists, through: :preferences
	has_one :playlist

	validates :first_name, presence: true, length: {maximum: 15}
	validates :last_name, presence: true, length: {maximum: 15}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
		     	   format: {with: VALID_EMAIL_REGEX},
		     	   uniqueness: { case_sensitive: false}
	has_secure_password

	validates :password, presence: true, length: {minimum: 6}, allow_nil: true


	def User.digest(string)
		cost = ActiveRecord::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

		BCrypt::Password.create(string, cost: cost)
	end


	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end


	#put inside of soundcloud service
	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_from_omniauth_hash(auth)
	end
	
	def self.create_from_omniauth(auth)
		#create new user if self.soundcloud_user_playlist !== 
		# return "hello" unless auth_hash
		create!(
			provider: auth['provider'],
			uid: auth['uid'],
			provider_location: auth['provider_location'],
			provider_full_name: auth['provider_full_name'],
			provider_nickname: auth['provider_nickname'],
			access_token: auth['credentials']['token']
		)
	end



	# def self.create_from_soundcloud(access_token)

	# 	create! do |user|
	# 		user.soundcloud_user_id = soundcloud_user["id"]
	# 		user.soundcloud_access_token = access_token["access_token"]
	# 	end
	# end
end
