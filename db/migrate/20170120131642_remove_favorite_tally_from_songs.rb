class RemoveFavoriteTallyFromSongs < ActiveRecord::Migration
  def change
  	remove_column :songs, :favorite_tally
  end
end
