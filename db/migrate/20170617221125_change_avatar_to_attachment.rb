class ChangeAvatarToAttachment < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatar, :string
    add_attachment :users, :image
  end
end
