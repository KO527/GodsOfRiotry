class AddFavCountToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :fav_count, :integer
  end
end
