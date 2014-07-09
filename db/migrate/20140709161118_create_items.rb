class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_id
      t.integer :user_id
      t.string :name
      t.float :price
      t.string :venue

      t.timestamps
    end
  end
end
