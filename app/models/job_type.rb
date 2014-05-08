class JobType < ActiveRecord::Base
  belongs_to :job_category
  accepts_nested_attributes_for :job_category
end
