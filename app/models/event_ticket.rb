class EventTicket < ActiveRecord::Base
	enum status: [:favorited, :unfavorited]
 	has_and_belongs_to_many :artists
 	has_and_belongs_to_many :acts
 	has_and_belongs_to_many :teams
 	belongs_to :subscriber_id, class_name: "User"
 	has_many :performers

 	validates :fav_count, presence: true, numericality: {only_integer: true}, allow_nil: true
 	validates :venue, presence: true, length: {maximum: 255}
 	validates :name, presence: true, length: {maximum: 50}
 	validates :happening, presence: true
	
end

 

