class Artist < ActiveRecord::Base
	has_many :songs
	belongs_to :playlist
	belongs_to :event_ticket
	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true
	
end
