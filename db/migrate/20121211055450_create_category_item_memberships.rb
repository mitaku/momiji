class CreateCategoryItemMemberships < ActiveRecord::Migration
  def change
    create_table :category_item_memberships do |t|
      t.string :type
      t.belongs_to :category_item
      t.integer :member_id

      t.timestamps
    end
    add_index :category_item_memberships, :category_item_id
    add_index :category_item_memberships, :member_id
  end
end
