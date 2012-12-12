class CreateContentManagementFeatureContents < ActiveRecord::Migration
  def change
    create_table :content_management_feature_contents do |t|
      t.string :name
      t.string :data
      t.string :md5
      t.string :content_type
      t.integer :content_length
      t.belongs_to :company

      t.timestamps
    end
    add_index :content_management_feature_contents, :company_id
  end
end
