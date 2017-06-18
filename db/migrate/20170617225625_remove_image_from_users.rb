class RemoveImageFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :image_file_name, :string
    remove_column :users, :image_content_type, :string
    remove_column :users, :image_file_size, :integer
    remove_column :users, :image_updated_at, :datetime
  end
end
