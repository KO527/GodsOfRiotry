class Artist < ActiveRecord::Base
	enum status: [:favorited, :unfavorited]
	has_many :songs
	belongs_to :playlist
	has_and_belongs_to_many :event_ticket
	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true


	private


		# user = User.find_by(params[:user_id])
end
 