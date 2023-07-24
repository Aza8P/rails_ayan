class AddColumnsToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :origin, :string
    add_column :flights, :two_way, :boolean, default: false
  end
end
