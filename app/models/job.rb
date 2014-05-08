class Job < ActiveRecord::Base
  has_one :client
  belongs_to :client
  has_one :job_type, :contract_type
  has_one :job_category, through: :job_type 
  has_one :location, through: :client
end