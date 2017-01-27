class AddUserRefToPreferences < ActiveRecord::Migration
  def change
  	add_reference :Preferences, :user, index: true, foreign_key: true
  end
end
