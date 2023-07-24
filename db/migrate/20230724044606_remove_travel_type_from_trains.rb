class RemoveTravelTypeFromTrains < ActiveRecord::Migration[7.0]
  def change
    remove_column :trains, :travel_type, :string
  end
end
