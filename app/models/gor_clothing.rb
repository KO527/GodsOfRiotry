class GorClothing < ActiveRecord::Base
	enum purchase_status: [:on_shelf, :purchased]
	enum status: [:unfavorited, :favorited]
	enum gender: [:male, :female, :androgynous]
	has_attached_file :image, :styles => {large: "90x90>", medium: "70x70>", thumb: "45x45#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	VALID_PRICE_REGEX = /\$?\d*\.?\d+/

	belongs_to :user
	belongs_to :wardrobe

	validates :quantity, presence: true, numericality: {only_integer: true}
	validates :sizes, presence: true, inclusion: {in: %w(S M L)}
	validates :price, format: {with: VALID_PRICE_REGEX}
	validates :description, presence: true
	validates :colors_available, presence: true
	# validates :possible_matches, inclusion: {} allow_blank: true
	
	has_many :images
	has_many :possible_matches, class_name: "Gor_clothing"
	validates_associated :image
	validates_presence_of :image, proc {|attributes| attributes[:type_of_image] == :show_picture if attributes['gor_clothing_id']['image'].blank?}
	validates_uniqueness_of :image, scope: [:type_of_image]
	accepts_nested_parameters_for :image, allow_destroy: true, reject_if: proc {|attributes| attributes[:type_of_image] != :show_picture || :first_shot || :back_shot || :model_shot}

	private
		def self.add_color(color)
			
		end

end
