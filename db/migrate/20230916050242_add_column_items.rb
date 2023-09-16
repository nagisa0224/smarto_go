class AddColumnItems < ActiveRecord::Migration[6.1]
  def up
    add_column :items, :notification, :boolean, null: false, default: false
  end
  
  def down
    remove_column :items, :notification, :boolean, null: false, default: false
  end
end
