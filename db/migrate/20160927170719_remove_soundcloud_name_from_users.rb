class RemoveSoundcloudNameFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :soundcloud_user_full_name, :string
  end
end
