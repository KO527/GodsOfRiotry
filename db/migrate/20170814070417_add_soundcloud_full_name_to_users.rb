class AddSoundcloudFullNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :soundcloud_full_name, :string
  end
end
