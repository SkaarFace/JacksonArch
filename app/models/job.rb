class Job < ActiveRecord::Base
  has_one :client
  belongs_to :client
  has_one :job_type
  has_one :contract
  belongs_to :job_type
  belongs_to :contract
  has_one :job_category, through: :job_type 
  has_one :location, through: :client
  accepts_nested_attributes_for :job_category, :job_type
end