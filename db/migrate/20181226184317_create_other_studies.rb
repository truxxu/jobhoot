class CreateOtherStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :other_studies do |t|
      t.string :title

      t.timestamps
    end
  end
end
