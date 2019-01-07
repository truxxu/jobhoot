class CreateUserHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hobbies do |t|
      t.references :user_profile, foreign_key: true
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
