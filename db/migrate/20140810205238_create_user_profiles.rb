class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
