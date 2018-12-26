class CreateUserLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_languages do |t|
      t.integer :proficiency

      t.timestamps
    end
  end
end
