class AddSoundcloudUserIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :soundcloud_user_id, :integer
  	add_index :users, :soundcloud_user_id
  end
end
