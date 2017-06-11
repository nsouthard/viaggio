class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :gender
      t.date :birthdate
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
