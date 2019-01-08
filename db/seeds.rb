require 'csv'
User.destroy_all
Study.destroy_all
OtherStudy.destroy_all
Language.destroy_all
Skill.destroy_all
Position.destroy_all
Trait.destroy_all
UserStudy.destroy_all
UserOtherStudy.destroy_all
UserLanguage.destroy_all
UserExperience.destroy_all
UserSkill.destroy_all
UserTrait.destroy_all
UserHobby.destroy_all

# studies
CSV.foreach('data_tables/applicant/studies.csv') do |row|
  Study.create(title: row[0])
end
puts 'studies created'

# other_studies
CSV.foreach('data_tables/applicant/other_studies.csv') do |row|
  OtherStudy.create(title: row[0])
end
puts 'other_studies created'

# languages
CSV.foreach('data_tables/applicant/languages.csv') do |row|
  Language.create(name: row[0])
end
puts 'languages created'

# skills
CSV.foreach('data_tables/applicant/skills.csv') do |row|
  Skill.create(name: row[0])
end
puts 'skills created'

# traits
CSV.foreach('data_tables/applicant/traits.csv') do |row|
  Trait.create(name: row[0], description: row[1])
end
puts 'traits created'

# Users
user = User.create(email: "df@gmail.com", password: "123456")
puts 'User created'

positiona = Position.create(title: "Manager")
positionb = Position.create(title: "Cleaner")
positionc = Position.create(title: "Mailman")
puts 'Position created'


url = "https://res.cloudinary.com/dsvpxb12b/image/upload/v1546510089/adult-beard-boy-220453.jpg"
user_profile = UserProfile.new(user_id: user.id, name: "Daniel", last_name:
    "Trujillo", birth_date: "1987-12-30", sex: "Male", phone: 123456,
    residency_status: "Australian Resident")
user_profile.remote_photo_url = url
user_profile.save
puts 'UserProfile created'

UserStudy.create(user_profile_id: user_profile.id, study_id: 31,
  status: "Completed", study_type:"Master", start_date: "2005-01-15", end_date:
"2010-12-15")

UserStudy.create(user_profile_id: user_profile.id, study_id: 20,
  status: "Completed", study_type:"Master", start_date: "2005-01-15", end_date:
  "2010-12-15")
puts 'UserStudy created'

UserOtherStudy.create(user_profile_id: user_profile.id, other_study_id: 12,
  study_type: "Other", start_date: "2005-01-15", end_date: "2010-12-15")
UserOtherStudy.create(user_profile_id: user_profile.id, other_study_id: 4,
  study_type: "Other", start_date: "2005-01-15", end_date: "2010-12-15")
puts 'UserOtherStudy created'

UserLanguage.create(user_profile_id: user_profile.id, language_id: 23,
  proficiency: 90)
UserLanguage.create(user_profile_id: user_profile.id, language_id: 11,
  proficiency: 50)
puts 'UserLanguage created'

WorkPreference.create(user_profile_id: user_profile.id, position_id: positiona.id,
  objectives: "Something", contract_type: "Casual")
puts 'WorkPreference created'

UserSkill.create(user_profile_id: user_profile.id, skill_id: 52)
UserSkill.create(user_profile_id: user_profile.id, skill_id: 42)
UserSkill.create(user_profile_id: user_profile.id, skill_id: 50)
puts 'UserSkill created'

UserExperience.create(user_profile_id: user_profile.id, position_id: positiona.id,
  skill_id: 10, status: "Finished", company_name: "Continental", contract_type:
  "Full Time", description: "something", start_date: "2005-01-15", end_date:
  "2010-12-15")
UserExperience.create(user_profile_id: user_profile.id, position_id: positionb.id,
  skill_id: 20, status: "Finished", company_name: "WG", contract_type:
  "Full Time", description: "something", start_date: "2005-01-15", end_date:
  "2010-12-15")
UserExperience.create(user_profile_id: user_profile.id, position_id: positionc.id,
  skill_id: 30, status: "Finished", company_name: "HorMinka", contract_type:
  "Full Time", description: "something", start_date: "2005-01-15", end_date:
  "2010-12-15")
puts 'UserExperience created'

UserTrait.create(user_profile_id: user_profile.id, trait_id: 8)
UserTrait.create(user_profile_id: user_profile.id, trait_id: 6)
puts 'UserTrait created'

UserHobby.create(user_profile_id: user_profile.id, name: "Running",
  category: "Outdoor Recreation")
UserHobby.create(user_profile_id: user_profile.id, name: "Football",
  category: "Outdoor Recreation")
UserHobby.create(user_profile_id: user_profile.id, name: "Painting",
  category: "Other")
puts 'UserHobby created'
