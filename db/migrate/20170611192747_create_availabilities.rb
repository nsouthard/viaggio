class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
