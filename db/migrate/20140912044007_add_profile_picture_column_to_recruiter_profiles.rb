class AddProfilePictureColumnToRecruiterProfiles < ActiveRecord::Migration
  def self.up
    add_attachment :recruiter_profiles, :profile_picture
  end

  def self.down
    remove_attachment :recruiter_profiles, :profile_picture
  end
end
