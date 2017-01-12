class Preference < ActiveRecord::Base

	belongs_to :subscriber_id, class_name: "User"
	has_many :favorited_artists, class_name: "Artist", foreign_key: "subscriber_id", dependent: :destroy
	has_many :favorited_songs, class_name: "Song", foreign_key: "subscriber_id", dependent: :destroy
	has_many :favorited_events, class_name: "Events", foreign_key: "subscriber_id", dependent: :destroy
	has_many :favorited_outfits, class_name: "Gor_clothing", foreign_key: "subscriber_id", dependent: :destroy

	validates :time_favorited, presence: true, format: {}
end
