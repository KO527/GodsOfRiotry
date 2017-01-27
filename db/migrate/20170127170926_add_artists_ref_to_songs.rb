class AddArtistsRefToSongs < ActiveRecord::Migration
  def change
  	add_reference :Songs, :artist, index: true, foreign_key: true
  end
end
