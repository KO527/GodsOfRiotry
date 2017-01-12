class Artist < ActiveRecord::Base
	has_many :songs
	belongs_to :playlist

	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
	validates :favorite_tally, presence: true #associated with artist's song's that have been favorited tallied

	private

		def Event_ticket_queried
			#if event_ticket is queried then associate interest with artist
		end
end
