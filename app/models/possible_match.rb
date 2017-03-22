class PossibleMatch < ActiveRecord::Base
	belongs_to :suggested_piece, class_name: 'Gor_clothing'
	belongs_to :contemplated_piece, class_name: 'Gor_clothing'
	validates :suggested_piece_id, presence: true
	validates :comtemplated_piece_id, presence: true
end
