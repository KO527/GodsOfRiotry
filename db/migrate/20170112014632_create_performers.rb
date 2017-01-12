class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|

      t.timestamps null: false
    end
  end
end
