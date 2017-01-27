class Song < ActiveRecord::Base
	enum status: [:favorited, :unfavorited]
	
	belongs_to :artists
	belongs_to :preferences
	belongs_to :playlist
	belongs_to :subscriber_id, class_name: "User"

	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
	validates :genre, presence: true, inclusion: {in: %w(#list_of_genres), message: "%{value} is not a valid genre"}
	validates :fav_count, presence: true, numericality: {only_integer: true}, allow_nil: true


	scope :created_before, -> (time) {where("created_at < ?", time) if time.present?}
	scope :users_with_shared_song_interests -> {where(preferences: :current_user.favorited_songs).distinct}
	scope :song_select_range -> {where(fav_count: song_avg_range - 10 .. song_avg_range + 10)}
	scope :distinct_songs -> {where.not(current_user.favorited_songs)}
	
	# associate models
	#last 10 favorited songs
		
	song_avg_range = current_user.average("favorited_songs.fav_count") # last 10 favorited songs

end
