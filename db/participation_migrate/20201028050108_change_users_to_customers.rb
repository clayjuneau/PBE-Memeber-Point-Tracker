class ChangeUsersToCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users, :customers
    rename_table :attendances, :customers_events
  end
end
