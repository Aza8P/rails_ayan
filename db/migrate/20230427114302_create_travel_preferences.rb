class CreateTravelPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.decimal :budget

      t.timestamps
    end
  end
end
