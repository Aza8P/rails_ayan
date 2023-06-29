class AddTypeToTravelPreferences < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_preferences, :type, :string
  end
end
