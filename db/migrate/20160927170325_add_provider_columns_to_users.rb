class AddProviderColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :provider_name, :string
  	add_column :users, :provider_location, :string
  	add_column :users, :provider_followers_count, :integer
  	add_column :users, :provider_playlist_count, :integer
  	add_column :users, :provider_full_name, :string
  end
end
