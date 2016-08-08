class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :number
      t.integer :econom_seats
      t.integer :business_seats

      t.timestamps null: false
    end
  end
end
