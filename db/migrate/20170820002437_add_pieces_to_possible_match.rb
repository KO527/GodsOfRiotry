class AddPiecesToPossibleMatch < ActiveRecord::Migration
	def change
		add_column :possible_matches, :contemplated_piece_id, :integer
		add_column :possible_matches, :suggested_piece_id, :integer
	end
end