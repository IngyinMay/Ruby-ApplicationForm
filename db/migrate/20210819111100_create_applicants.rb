class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name, null: false, :limit => 100
      t.string :email, null: false, unique: true, :limit => 100
      t.timestamp :apply_date
      t.integer :blacklist_status, null: false, :limit => 1, default: 0
      t.string :profile_photo, null: false
      t.integer :total_exp_year, :limit => 3
      t.text :comment
      t.integer :status, null: false, :limit => 1, default: 0
      t.date :dob, null: false
      t.string :phone_no1, null: false, :limit => 30
      t.string :phone_no2, :limit => 30
      t.string :current_address, null: false
      t.string :hometown_address
      t.string :university, :limit => 100
      t.string :degree, :limit => 100
      t.string :graduated_year, :limit => 20
      t.string :certificate
      t.text :internship_info
      t.integer :has_job_exp, null: false, :limit => 1, default: 0
      t.text :job_experiences
      t.text :language_skills
      t.text :career_skills
      t.string :diploma_name, :limit => 100
      t.string :master_university, :limit => 100
      t.string :master_degree, :limit => 100
      t.string :master_graduated_year, :limit => 20
      t.timestamps
    end
  end
end
