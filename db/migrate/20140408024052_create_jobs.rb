class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :contract
      t.belongs_to :job_type
      t.belongs_to :client
      t.belongs_to :client_location
      t.timestamps
    end
  end
end
