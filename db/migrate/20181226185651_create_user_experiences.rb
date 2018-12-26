class CreateUserExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_experiences do |t|
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
