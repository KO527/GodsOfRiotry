class AddColumnsToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :song_name, :string
  	add_column :songs, :artist_name, :string
  end
end
