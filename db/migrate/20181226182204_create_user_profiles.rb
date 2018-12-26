class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :last_name
      t.datetime :birth_date
      t.string :sex
      t.integer :phone
      t.string :residency_status
      t.string :contract_type

      t.timestamps
    end
  end
end
