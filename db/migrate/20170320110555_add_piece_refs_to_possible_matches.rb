class AddPieceRefsToPossibleMatches < ActiveRecord::Migration
  def change
  	add_reference :possible_matches, :contemplated_piece, index: true, foreign_key: true
  	add_reference :possible_matches, :suggested_piece, index: true, foreign_key: true
  end
end
