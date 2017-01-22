class AddFavCountToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :fav_count, :integer
  end
end
