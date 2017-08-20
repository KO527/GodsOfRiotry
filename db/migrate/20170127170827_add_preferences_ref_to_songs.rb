class AddPreferencesRefToSongs < ActiveRecord::Migration
  def change
  	add_reference :songs, :preference, index: true, foreign_key: true
  end
end
