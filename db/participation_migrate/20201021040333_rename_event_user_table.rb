class RenameEventUserTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :[event_users], :[users]
  end
end
