class CreateRsetMcmContents < ActiveRecord::Migration
  def change
    create_table :rset_mcm_contents do |t|
      t.string :name
      t.string :type
      t.belongs_to :company
      t.string :ancestry
      t.string :data
      t.integer :file_size

      t.timestamps
    end
    add_index :rset_mcm_contents, :company_id
  end
end
