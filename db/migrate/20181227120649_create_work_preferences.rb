class CreateWorkPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_preferences do |t|
      t.references :user_profile, foreign_key: true
      t.references :study, foreign_key: true
      t.text :objectives
      t.string :contract_type

      t.timestamps
    end
  end
end
