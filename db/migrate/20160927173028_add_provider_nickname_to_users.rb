class AddProviderNicknameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :provider_nickname, :string
  end
end
