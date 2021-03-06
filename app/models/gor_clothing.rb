class GorClothing < ActiveRecord::Base
	enum purchase_status: [:on_shelf, :purchased]
	enum status: [:unfavorited, :favorited]
	has_attached_file :image, :styles => {large: "90x90>", medium: "70x70>", thumb: "45x45#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	VALID_PRICE_REGEX = /\$?\d*\.?\d+/

	belongs_to :user
	belongs_to :wardrobe

	validates :quantity, presence: true, numericality: {only_integer: true}
	validates :sizes, presence: true, inclusion: {in: %w(S M L)}
	validates :gender, presence: true, inclusion: {in: %w(male female androgynous)}
	validates :price, format: {with: VALID_PRICE_REGEX}
	validates :description, presence: true
	validates :colors_available, presence: true
	validates :merch_type, presence: true, inclusion: {in: %w(top bottom)}
	validates :standalone, presence: true
	# validates :possible_matches, inclusion: {} allow_blank: true
	
	has_many :static_pieces, class_name: 'PossibleMatch',
				    foreign_key: :suggested_piece_id,
				    dependent: :destroy

	has_many :toggled_pieces, class_name: 'PossibleMatch',
			  	       foreign_key: :contemplated_piece_id,
			  	       dependent: :destroy

	has_many :suggested_pieces, through: :static_pieces, source: :suggested_piece
	has_one :contemplated_piece, through: :toggled_pieces

	has_many :images
	validates_associated :image
	validates_presence_of :image
	validates_uniqueness_of :image, scope: [:type_of_image]
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc {|attributes| attributes[:type_of_image] != :first_shot || :back_shot || :model_shot}
	# :show_picture ||
	private

		def next_male
  			Gor_Clothing.where("gor_clothings.id > ? AND gor_clothings.gender = ?", self.id, male).order("gor_clothings.id ASC")
		end

		def previous_male
 			Gor_Clothing.where("gor_clothings.id < ? AND gor_clothings.gender = ?", self.id, male).order("gor_clothings.id DESC")
		end

		def next_female
			Gor_Clothing.where("gor_clothings.id > ? AND gor_clothings.gender = ?", self.id, female).order("gor_clothings.id ASC")
		end

		def previous_female
		 	Gor_Clothing.where("gor_clothings.id < ? AND gor_clothings.gender = ?", self.id, female).order("gor_clothings.id DESC")
		end

		def self.add_color(color)
			
		end

end
