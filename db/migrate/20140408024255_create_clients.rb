class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone_number
      t.belongs_to :client
      t.timestamps
    end
  end
end
