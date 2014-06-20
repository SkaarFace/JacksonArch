class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :zip_code
      t.string :state
      t.string :city
      t.float :latitude
      t.float :longitude
      t.belongs_to :user
      t.belongs_to :client

      t.timestamps
    end
  end
end
