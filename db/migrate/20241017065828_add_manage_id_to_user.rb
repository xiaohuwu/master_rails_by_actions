class AddManageIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :manage_id, :integer
  end

end
