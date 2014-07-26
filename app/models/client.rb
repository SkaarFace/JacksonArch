class Client < ActiveRecord::Base
  has_many :users
  has_many :jobs
  belongs_to :job
  belongs_to :user
  has_many :client_locations
end
