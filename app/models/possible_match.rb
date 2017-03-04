class PossibleMatch < ActiveRecord::Base
	belongs_to :evaluated_piece, class_name: 'Gor_clothing'
	belongs_to :suggested_piece, class_name: 'Gor_clothing'
	validates :evaluated_piece_id, presence: true
	validates :suggested_piece_id, presence: true
end
