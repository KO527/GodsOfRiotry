class RemoveArtistNameFromSongs < ActiveRecord::Migration
  def change
  	remove_column :songs, :artist_name
  end
end
