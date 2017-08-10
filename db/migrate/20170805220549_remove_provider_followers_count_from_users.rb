class RemoveProviderFollowersCountFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :provider_followers_count
  end
end
