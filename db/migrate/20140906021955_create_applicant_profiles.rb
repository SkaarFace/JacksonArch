class CreateApplicantProfiles < ActiveRecord::Migration
  def change
    create_table :applicant_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
