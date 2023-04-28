class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :destination
      t.decimal :budget
      t.integer :user_id
      
      t.timestamps
    end
  end
end
