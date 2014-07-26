json.array!(@job_categories) do |job_category|
  json.extract! job_category, :id, :name
  json.url admin_job_category_url(job_category, format: :json)
end
