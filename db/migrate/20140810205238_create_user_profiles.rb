class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.belongs_to :user
      t.attachment :profile_pic
      t.timestamps
    end
  end
end
