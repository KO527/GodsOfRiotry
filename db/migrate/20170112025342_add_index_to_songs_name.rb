class AddIndexToSongsName < ActiveRecord::Migration
  def change
  	add_index :songs, [:song_name, :artist_name], unique: true
  end
end
