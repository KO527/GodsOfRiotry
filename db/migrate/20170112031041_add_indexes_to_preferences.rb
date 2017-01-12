class AddIndexesToPreferences < ActiveRecord::Migration
  def change
  	add_index :preferences, :time_favorited, unique: true
  end
end
