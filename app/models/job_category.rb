class JobCategory < ActiveRecord::Base
  has_many :job_types
  accepts_nested_attributes_for :job_types
end
