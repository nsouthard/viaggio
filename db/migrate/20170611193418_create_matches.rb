class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.integer :location_id
      t.decimal :cost
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
