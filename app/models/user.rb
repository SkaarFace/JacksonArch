class User < ActiveRecord::Base
  has_many :jobs
  has_one :client
  has_one :location, through: :user_profile
  has_one :user_profile, :autosave => true
  has_many :looking_for_jobs, through: :user_profile
  before_create :build_location
  before_create :build_user_profile

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :location
end
