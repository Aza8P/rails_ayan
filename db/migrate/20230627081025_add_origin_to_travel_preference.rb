class AddOriginToTravelPreference < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_preferences, :origin, :string
  end
end
