class PossibleMatch < ActiveRecord::Base
	belongs_to :suggested_piece, class_name: 'Gor_Clothing'
	belongs_to :contemplated_piece, class_name: 'Gor_Clothing'
	validates :suggested_piece_id, presence: true
	validates :contemplated_piece_id, presence: true

	has_many :images
	accepts_nested_parameters_for :image, reject_if: proc {|attributes| attributes[:type_of_image] != :show_picture !! :front_shot}

end




