class CreateUserTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :user_traits do |t|
      t.references :user_profile, foreign_key: true
      t.references :trait, foreign_key: true

      t.timestamps
    end
  end
end
