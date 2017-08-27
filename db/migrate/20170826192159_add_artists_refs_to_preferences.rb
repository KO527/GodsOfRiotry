class AddArtistsRefsToPreferences < ActiveRecord::Migration
  def change
  	add_reference :preferences, :artists, type: :string
  end
end
