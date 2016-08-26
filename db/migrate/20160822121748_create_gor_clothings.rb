class CreateGorClothings < ActiveRecord::Migration
  def change
    create_table :gor_clothings do |t|

      t.timestamps null: false
    end
  end
end
