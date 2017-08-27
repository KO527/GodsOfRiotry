class RemoveSongsNameFromSongs < ActiveRecord::Migration
  def change
  	remove_column :songs, :song_name
  end
end
