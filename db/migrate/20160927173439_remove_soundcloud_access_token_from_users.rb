class RemoveSoundcloudAccessTokenFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :soundcloud_access_token, :string
  end
end
