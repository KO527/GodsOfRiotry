class Act < ActiveRecord::Base
	before_save {self.name = name.downcase}

	has_and_belongs_to_many :event_tickets
	validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
end
