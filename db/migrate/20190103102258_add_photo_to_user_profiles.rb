class AddPhotoToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :photo, :string
  end
end
