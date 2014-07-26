json.array!(@jobs) do |job|
  json.extract! job, :id
  json.url client_job_url(job, format: :json)
end
