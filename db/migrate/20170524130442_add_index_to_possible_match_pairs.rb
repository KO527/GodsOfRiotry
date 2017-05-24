class AddIndexToPossibleMatchPairs < ActiveRecord::Migration
  def change
  	add_index :possible_matches, [:contemplated_piece_id, :suggested_piece_id], unique: true, :name => 'indexed_possible_match_pair'
  end
end
