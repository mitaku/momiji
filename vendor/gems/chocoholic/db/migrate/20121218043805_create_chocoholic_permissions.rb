class CreateChocoholicPermissions < ActiveRecord::Migration
  def change
    create_table :chocoholic_permissions do |t|
      t.string :resource_type
      t.integer :content_id
      t.integer :resource_id
      t.boolean :writable, :default => false, :null => false
      t.boolean :readonly, :default => false, :null => false

      t.timestamps
    end

    add_index :chocoholic_permissions, [:content_id]
    add_index :chocoholic_permissions, [:resource_id, :resource_type]
  end
end
