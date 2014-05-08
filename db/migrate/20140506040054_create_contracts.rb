class CreateContracts < ActiveRecord::Migration
  def up
    create_table :contracts do |t|
      t.string :type
      t.string :terms
      t.belongs_to :job
      t.timestamps
    end
  end

  def down
    drop_table :contracts
  end
end
