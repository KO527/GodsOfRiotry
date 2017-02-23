class GorClothing < ActiveRecord::Base
	enum purchase_status: [:on_shelf, :purchased]
	enum status: [:unfavorited, :favorited]
	enum gender: [:male, :female, :androgynous]
	has_attached_file :image, :styles => {large: "90x90>", medium: "70x70>", thumb: "45x45#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	VALID_PRICE_REGEX = /\$?\d*\.?\d+/


	validates :quantity, presence: true, numericality: {only_integer: true}
	validates :sizes, presence: true, inclusion: {in: %w(S M L)}
	validates :price, format: {with: VALID_PRICE_REGEX}
	validates :description, presence: true
	validates :colors_available, presence: true
	
	has_many :images

	validates_associated :image
	validates_presence_of :image
	
	private

		def self.add_color(color)
			
		end

end
