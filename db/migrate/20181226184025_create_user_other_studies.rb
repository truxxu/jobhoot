class CreateUserOtherStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_other_studies do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
