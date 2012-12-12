class CreateContentManagementFeatureDirectories < ActiveRecord::Migration
  def change
    create_table :content_management_feature_directories do |t|
      t.string :name
      t.string :ancestry
      t.integer :company_id

      t.timestamps
    end

    add_index :content_management_feature_directories, [:company_id, :ancestry], :name => :index_content_directories_company_id_and_ancestry
  end
end
