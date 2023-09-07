class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :shop_id, null: false
      t.string :product_name, null: false
      t.integer :stock
      t.integer :minimum_stock
      t.boolean :is_active, null: false, default: true
      t.text :introduction
      t.timestamps
    end
  end
end
