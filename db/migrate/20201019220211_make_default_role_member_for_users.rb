class MakeDefaultRoleMemberForUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :string, :default => "member"
  end
end
