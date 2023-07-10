class AddTwoWayToTravelPreferences < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_preferences, :two_way, :boolean, default: false
  end
end
