class RemoveProviderAttributesFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :provider_name
  	remove_column :users, :provider_location
  	remove_column :users, :provider_followers_location
  	remove_column :users, :provider_playlist_count
  	remove_column :users, :provider_full_name
  	remove_column :users, :provider_nickname
  	remove_column :users, :provider
  end
end
