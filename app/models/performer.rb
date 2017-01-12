class Performer < ActiveRecord::Base
	before_save {self.name = name.downcase}

	belongs_to :event_tickets
	validates :name, presence: true, length: {maximum: 50}, unique: {case_sensitive: false}
end
