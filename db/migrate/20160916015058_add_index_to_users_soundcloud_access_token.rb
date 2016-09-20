class AddIndexToUsersSoundcloudAccessToken < ActiveRecord::Migration
  def change
  	add_index :users, :soundcloud_access_token, unique: true
  end
end
