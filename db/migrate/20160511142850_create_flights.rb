class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :number
      t.string :from
      t.string :destination
      t.timestamp :departure
      t.timestamp :arrival
      t.integer :econom_price
      t.integer :business_price

      t.timestamps null: false
    end
  end
end
