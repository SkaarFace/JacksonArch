class CreateRecruiterProfiles < ActiveRecord::Migration
  def change
    create_table :recruiter_profiles do |t|

      t.timestamps
    end
  end
end
