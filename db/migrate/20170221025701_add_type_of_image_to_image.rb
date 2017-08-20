class AddTypeOfImageToImage < ActiveRecord::Migration
  def change
  	add_column :images, :type_of_image, :integer, default: 0, null: false
  end
end
