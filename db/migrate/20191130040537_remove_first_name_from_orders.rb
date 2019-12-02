class RemoveFirstNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :first_name, :string
    remove_column :orders, :last_name, :string
    remove_column :orders, :token, :string
  end
end
