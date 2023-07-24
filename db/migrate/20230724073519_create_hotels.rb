class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.timestamps
    end
  end
end
