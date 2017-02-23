class AddIndexToTypeOfImage < ActiveRecord::Migration
  def change
  	add_index :images, :type_of_image, unique: true
  end
end
