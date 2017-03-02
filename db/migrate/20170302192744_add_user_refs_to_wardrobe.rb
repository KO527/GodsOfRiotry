class AddUserRefsToWardrobe < ActiveRecord::Migration
  def change
  	add_reference :wardrobes, :user, index: true, foreign_key: true
  end
end
