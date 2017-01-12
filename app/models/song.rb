class Song < ActiveRecord::Base

	belongs_to :artists
	belongs_to :preferences
	belongs_to :playlist
	belongs_to :subscriber_id, class_name: "User"

	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
	validates :genre, presence: true, inclusion: {in: %w(#list_of_genres), message: "%{value} is not a valid genre"}
	validates :favorite_tally, presence: true, numericality: {only_integer: true}

end
