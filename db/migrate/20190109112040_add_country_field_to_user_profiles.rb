class AddCountryFieldToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :origin_country, :string
    add_column :user_profiles, :residence_country, :string
    add_column :user_profiles, :address, :string
  end
end
