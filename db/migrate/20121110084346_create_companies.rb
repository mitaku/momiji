class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :code
      t.string :type
      t.integer :management_id

      t.timestamps
    end

    add_index :companies, :type
    add_index :companies, :management_id
  end
end
