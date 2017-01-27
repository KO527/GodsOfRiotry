class AddPreferencesRefToSongs < ActiveRecord::Migration
  def change
  	add_reference :Songs, :preference, index: true, foreign_key: true
  end
end
