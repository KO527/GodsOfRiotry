class AddPlaylistRefToSongs < ActiveRecord::Migration
  def change
  	add_reference :Songs, :playlist, index: true, foreign_key: true
  end
end
