class AddFavCountToPreferences < ActiveRecord::Migration
  def change
  	add_column :preferences, :fav_count, :integer
  end
end
