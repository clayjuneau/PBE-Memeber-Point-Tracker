class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :role
      t.integer :points
      t.string :password_digest

      t.timestamps
    end
  end
end
