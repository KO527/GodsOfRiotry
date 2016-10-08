class AddSoundcloudCredentialsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :soundcloud_name, :string
  	add_column :users, :soundcloud_user_location, :string
  	add_column :users, :soundcloud_user_city, :string
  	add_column :users, :soundcloud_user_country, :string
  	add_column :users, :soundcloud_user_followers_count, :string
  	add_column :users, :soundcloud_user_nickname, :string, unique: true
  	add_column :users, :soundcloud_user_playlist_count, :string
  	add_column :users, :soundcloud_user_full_name, :string
  end
end
