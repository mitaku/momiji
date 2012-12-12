class AddDirectoryIdToContents < ActiveRecord::Migration
  def change
    add_column :content_management_feature_contents, :directory_id, :integer
    add_index :content_management_feature_contents, [:directory_id]
  end
end
