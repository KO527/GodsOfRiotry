class RemoveProviderAttributesFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :provider_name
  	remove_column :users, :provider_location
  	remove_column :users, :provider_playlist_count
  	remove_column :users, :provider_full_name
  	remove_column :users, :provider_nickname
  end
end
