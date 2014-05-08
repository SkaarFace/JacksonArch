class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :name
      t.belongs_to :job_category
      t.belongs_to :job
      t.timestamps
    end
  end
end
