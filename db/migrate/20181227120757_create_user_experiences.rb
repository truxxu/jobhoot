class CreateUserExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_experiences do |t|
      t.references :user_profile, foreign_key: true
      t.references :study, foreign_key: true
      t.references :skill, foreign_key: true
      t.string :company_name
      t.string :status
      t.string :contract_type
      t.datetime :start_date
      t.datetime :end_date
      t.text :description

      t.timestamps
    end
  end
end
