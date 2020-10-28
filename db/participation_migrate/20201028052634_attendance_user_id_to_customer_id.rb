class AttendanceUserIdToCustomerId < ActiveRecord::Migration[6.0]
  def change
    drop_table :customers_events
  end
end
