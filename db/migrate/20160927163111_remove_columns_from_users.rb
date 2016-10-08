class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :soundcloud_user_city
  	remove_column :users, :soundcloud_user_nickname
  	remove_column :users, :soundcloud_user_country
  	remove_column :users, :soundcloud_full_name 
  end
end
