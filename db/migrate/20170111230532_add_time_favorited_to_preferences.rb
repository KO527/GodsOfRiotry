class AddTimeFavoritedToPreferences < ActiveRecord::Migration
  def change
  	add_column :preferences, :time_favorited, :datetime
  end
end
