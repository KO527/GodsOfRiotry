class AddAttachmentImageToGorClothings < ActiveRecord::Migration
  def self.up
    change_table :gor_clothings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :gor_clothings, :image
  end
end
