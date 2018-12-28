class CreateUserOtherStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_other_studies do |t|
      t.references :user_profile, foreign_key: true
      t.references :other_study, foreign_key: true
      t.string :study_type
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
