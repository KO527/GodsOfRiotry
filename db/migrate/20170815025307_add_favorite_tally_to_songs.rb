class AddFavoriteTallyToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :favorite_tally, :string
  end
end
