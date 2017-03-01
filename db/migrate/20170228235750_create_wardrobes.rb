class CreateWardrobes < ActiveRecord::Migration
  def change
    create_table :wardrobes do |t|

      t.timestamps null: false
    end
  end
end
