class User < ActiveRecord::Base

	attr_accessor :remember_token

	before_create :set_default_role

	before_save {self.email = email.downcase}

	enum role: [:registered, :admin]
	
	has_many :favorited_events, through: :preferences, class_name: "Event_ticket"
	has_many :favorited_songs, through: :preferences, class_name: "Song"
	has_many :favorited_outfits, through: :preferences, class_name: "Gor_clothing"
	has_many :favorited_artists, through: :preferences, class_name: "Artist"
	has_many :preferences, foreign_key: "user_id", dependent: :destroy
	has_many :Gor_clothings
	has_one :playlist
	has_many :songs, through: :playlist
	has_many :event_tickets

	validates :full_name, presence: true, length: {maximum: 30}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
		     	   format: {with: VALID_EMAIL_REGEX},
		     	   uniqueness: { case_sensitive: false}
	validates :gender, presence: true, inclusion: {in: %w(male female androgynous)}

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

	def self.create_from_soundcloud(access_token)

	  create! do |user|
	    user.soundcloud_user_id = soundcloud_user["id"]
	    user.soundcloud_access_token = access_token["access_token"]
	  end
	end

	def self.remove_soundcloud_credentials

		destroy! do |user|
			user.soundcloud_user_id = nil
			user.soundcloud_access_token = nil
		end
	end

	def validate_minimum_number_of_artists_have_not_been_reached
		errors.add_to_base("You need to add at least these artists") unless self.preferences.artists >= 3
	end
	
	def validate_maximum_number_of_artists_have_been_reached
		errors.add_to_base("You only need to add five artists at the most") unless self.preferences.artists <= 5
	end

	private

	def set_default_role
		self.role ||= User.find_by_role('registered')
	end
end
