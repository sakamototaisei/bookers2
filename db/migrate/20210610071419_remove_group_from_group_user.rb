class RemoveGroupFromGroupUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :group_users, :group, :integer
  end
end
