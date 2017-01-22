class RemoveTimeFavoritedToPreferences < ActiveRecord::Migration
  def change
  	remove_column :preferences, :time_favorited
  end
end
