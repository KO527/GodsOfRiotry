class AddPieceRefsToPossibleMatches < ActiveRecord::Migration
	def change
		add_reference :possible_matches, :suggested_piece, type: :string
		add_reference :possible_matches, :contemplated_piece, type: :string
	end
end