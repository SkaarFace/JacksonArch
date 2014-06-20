class CreateClients < ActiveRecord::Migration
  def up
    create_table :clients do |t|
      t.belongs_to :job
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
