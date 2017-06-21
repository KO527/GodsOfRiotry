class AddImageRefsToPossibleMatches < ActiveRecord::Migration
  def change
  	add_reference :possible_matches, :image, foreign_key: true
  end
end
