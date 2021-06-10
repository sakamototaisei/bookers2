class AddGroupIdToGroupUser < ActiveRecord::Migration[5.2]
  def change
    add_column :group_users, :group_id, :integer
  end
end
