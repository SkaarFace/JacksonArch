json.array!(@job_types) do |job_type|
  json.extract! job_type, :id, :name
  json.url admin_job_type_url(job_type, format: :json)
end
