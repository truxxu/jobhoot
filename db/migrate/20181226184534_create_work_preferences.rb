class CreateWorkPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_preferences do |t|
      t.text :objectives

      t.timestamps
    end
  end
end
