class AddFileSizeColumnToContent < ActiveRecord::Migration
  def change
    add_column :chocoholic_contents, :file_size, :integer
  end
end
