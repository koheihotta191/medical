class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    # add_column :users, :role, :integer, default: 0, null: false
    change_column_default :users, :role, from: nil, to: 0
  end
end
