class RemoveSoundcloudColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :soundcloud_name
  	remove_column :users, :soundcloud_user_location
  	remove_column :users, :soundcloud_user_followers_count
  	remove_column :users, :soundcloud_user_playlist_count
  	remove_column :users, :soundcloud_user_id
  end
end
