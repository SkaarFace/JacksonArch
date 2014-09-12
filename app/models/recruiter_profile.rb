class RecruiterProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy
end
