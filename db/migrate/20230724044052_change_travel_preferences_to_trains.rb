class ChangeTravelPreferencesToTrains < ActiveRecord::Migration[7.0]
  def change
    rename_table :travel_preferences, :trains
  end
end
