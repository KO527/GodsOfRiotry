class RemoveReferencesFromPossibleMatch < ActiveRecord::Migration
  def change
  	remove_reference :possible_matches, :suggested_piece
  	remove_reference :possible_matches, :evaluated_piece
  end
end
