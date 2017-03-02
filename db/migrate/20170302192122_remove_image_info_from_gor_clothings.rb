class RemoveImageInfoFromGorClothings < ActiveRecord::Migration
  def change
  	remove_column :gor_clothings, :image_file_name
  	remove_column :gor_clothings, :image_content_type
  	remove_column :gor_clothings, :image_file_size
  	remove_column :gor_clothings, :image_updated_at
  end
end
