class GorClothing < ActiveRecord::Base
	has_attached_file :image, :styles => {large: "90x90>", medium: "70x70>", thumb: "45x45#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates :quantity 
	validates :sizes
	validates :price
	validates :description
	validates :image
end
