class CreateChocoholicContents < ActiveRecord::Migration
  def change
    create_table :chocoholic_contents do |t|
      t.string :name
      t.string :type
      t.integer :company_id
      t.integer :owner_id
      t.string :ancestry
      t.string :data

      t.timestamps
    end

    add_index :chocoholic_contents, [:type, :company_id]
    add_index :chocoholic_contents, [:company_id, :owner_id]
    add_index :chocoholic_contents, [:ancestry]
  end
end
