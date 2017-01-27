class GorClothing < ActiveRecord::Base
	enum status: [:favorited, :unfavorited]
	has_attached_file :image, :styles => {large: "90x90>", medium: "70x70>", thumb: "45x45#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	VALID_PRICE_REGEX = /\$?\d*\.?\d+/

	validates :quantity, presence: true
	validates :sizes, presence: true
	validates :price, format: {with: VALID_PRICE_REGEX} 
	validates :description, presence: true
	validates :colors_available, presence: true
	validates :image, presence: true
end
