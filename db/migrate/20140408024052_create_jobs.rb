class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :job_category
      t.belongs_to :client
      t.timestamps
    end
  end
end
