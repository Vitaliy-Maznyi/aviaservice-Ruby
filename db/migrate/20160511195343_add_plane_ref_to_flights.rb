class AddPlaneRefToFlights < ActiveRecord::Migration
  def change
    add_reference :flights, :plane, index: true, foreign_key: true
  end
end
