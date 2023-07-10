class ChangeTypeToTravelType < ActiveRecord::Migration[7.0]
  def change
    rename_column :travel_preferences, :type, :travel_type
  end
end
