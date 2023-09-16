class AddStatusToToGos < ActiveRecord::Migration[6.1]
  def change
    add_column :to_gos, :status, :boolean, default: false, null: false
  end
end
