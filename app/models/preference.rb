class Preference < ActiveRecord::Base

	belongs_to :subscriber_id, class_name: "User", counter_cache: true
	has_many :favorited_artists, -> {where status: favorited}, class_name: "Artists", dependent: :destroy
	has_many :favorited_songs, -> {where status: favorited}, class_name: "Song", dependent: :destroy
	has_many :favorited_events, -> {where status: favorited}, class_name: "Event_ticket",  dependent: :destroy
	has_many :favorited_outfits, -> {where status: favorited}, class_name: "Gor_Clothing", dependent: :destroy

	validates :subscriber_id, presence: true
	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true
	
	accepts_nested_attributes_for :artists
	accepts_nested_attributes_for :events

	#Scope is employed to help user find other users with similar tastes
	#FIgure out how to come up with user's preferences that share three of the subscriber_id's favorited songs
	# scope :with_shared_song_interests -> {where(preferences: :subscriber_id.favorited_songs.exists?(3))} #alternative exists?(2)

end
