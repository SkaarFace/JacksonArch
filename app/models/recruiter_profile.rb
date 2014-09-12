class RecruiterProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

end
