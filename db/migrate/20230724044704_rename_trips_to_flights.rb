class RenameTripsToFlights < ActiveRecord::Migration[7.0]
  def change
    rename_table :trips, :flights
  end
end
