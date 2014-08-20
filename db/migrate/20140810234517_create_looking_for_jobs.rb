class CreateLookingForJobs < ActiveRecord::Migration
  def change
    create_table :looking_for_jobs do |t|
      t.belongs_to :user_profile
      t.timestamps
    end
  end
end
