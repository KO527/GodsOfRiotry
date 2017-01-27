class AddUserRefsToPlaylists < ActiveRecord::Migration
  def change
  	add_reference :Playlists, :user, index: true, foreign_key: true
  end
end
