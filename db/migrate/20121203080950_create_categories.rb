class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :owner_id
      t.string :type

      t.timestamps
    end
    add_index :categories, [:type, :owner_id]
  end
end
