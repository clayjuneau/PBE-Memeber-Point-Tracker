class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.date :end_time
      t.string :location
      t.boolean :mandatory

      t.timestamps
    end
  end
end
