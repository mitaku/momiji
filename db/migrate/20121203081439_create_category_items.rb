class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
      t.string :name
      t.belongs_to :category

      t.timestamps
    end
    add_index :category_items, :category_id
  end
end
