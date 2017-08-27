class Artist < ActiveRecord::Base
	before_save :default_values

	self.primary_key = 'name'
	enum status: [:favorited, :unfavorited]
	has_many :songs
	belongs_to :playlist
	belongs_to :preferences
	has_and_belongs_to_many :event_ticket
	validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
	validates_uniqueness_of :name, :scope => :user_id
	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true

	def default_values
		self.status ||= 'favorited'
		if !self.persisted?
			fav_count += 1
		end
	end
end
