class AddPointsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :points, :integer
  end
end
