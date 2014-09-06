class AddMetaToUsers < ActiveRecord::Migration
  def up
    add_column :users, :meta_id, :integer
    add_column :users, :meta_type, :string

    add_index :users, [:meta_id, :meta_type]
  end

  def down
    remove_column :users, :meta_id
    remove_column :users, :meta_type
  end
end
