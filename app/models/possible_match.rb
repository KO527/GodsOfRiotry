class PossibleMatch < ActiveRecord::Base
	belongs_to :suggested_piece, class_name: 'Gor_Clothing'
	belongs_to :contemplated_piece, class_name: 'Gor_Clothing'
	validates :suggested_piece_id, presence: true
	validates :contemplated_piece_id, presence: true

	has_one :image
	validates_associated :image

	validates_uniqueness_of :image, conditions: -> {where (type_of_image: 'show_picture')
	# accepts_nested_parameters_for :image, reject_if: proc {|attributes| attributes[:type_of_image] != :show_picture !! :front_shot}
	private

	
		def next_suggested_male
	  		Gor_Clothing.where("gor_clothings.id >= ? AND gor_clothing.gender = ?", gor_clothing.first.id, male).order("gor_clothings.id ASC")
		end

		def previous_suggested_male
			Gor_Clothing.where("gor_clothings.id <= ? AND gor_clothing.gender = ?", gor_clothing.last.id, male).order("gor_clothings.id DESC")
		end

		def next_suggested_female
			Gor_Clothing.where("gor_clothings.id >= ? AND gor_clothing.gender = ?", gor_clothing.first.id, female).order("gor_clothings.id ASC")
		end

		def previous_suggested_female
		 	Gor_Clothing.where("gor_clothings.id <= ? AND gor_clothing.gender = ?", gor_clothing.last.id, female).order("gor_clothings.id DESC")
		end
	end
	
end




