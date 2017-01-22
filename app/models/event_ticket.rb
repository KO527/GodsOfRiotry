class EventTicket < ActiveRecord::Base
	
 	has_many :artists
 	has_many :performers
 	has_many :teams
 	belongs_to :subscriber_id, class_name: "User"

 	validates :fav_count, presence: true, numericality: {only_integer: true}, allow_nil: true
 	validates :venue, presence: true, length: {maximum: 255}
 	validates :name, presence: true, length: {maximum: 50}
 	validates :happening, presence: true, format: {}
 	
end

 

