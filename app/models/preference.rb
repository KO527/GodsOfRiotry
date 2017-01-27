class Preference < ActiveRecord::Base

	belongs_to :subscriber_id, class_name: "User"
	has_many :favorited_artists, -> {where status: favorited}, class_name: "Artist", foreign_key: "user_id", dependent: :destroy
	has_many :favorited_songs, -> {where status: favorited}, class_name: "Song", foreign_key: "user_id", dependent: :destroy
	has_many :favorited_events, -> {where status: favorited}, class_name: "Event_ticket", foreign_key: "user_id", dependent: :destroy
	has_many :favorited_outfits, -> {where status: favorited}, class_name: "Gor_clothing", foreign_key: "user_id", dependent: :destroy

	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true
end
