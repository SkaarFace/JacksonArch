json.array!(@looking_for_jobs) do |looking_for_job|
  json.extract! looking_for_job, :id
  json.url looking_for_job_url(looking_for_job, format: :json)
end
