class CreateRsetMcmPermissions < ActiveRecord::Migration
  def change
    create_table :rset_mcm_permissions do |t|
      t.string :resource_type
      t.integer :resource_id
      t.string :mode
      t.belongs_to :content

      t.timestamps
    end
    add_index :rset_mcm_permissions, :content_id
    add_index :rset_mcm_permissions, [:resource_id, :resource_type]
  end
end
