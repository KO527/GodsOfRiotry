class Playlist < ActiveRecord::Base
	has_many :songs
	has_many :favorited_songs, class_name: "Song"
	belongs_to :subsriber_id, class_name: "User"
end
