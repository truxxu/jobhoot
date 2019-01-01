User.destroy_all

# Users
user = User.create(email: "df@gmail.com", password: "123456")
puts 'User created'

user_profile = UserProfile.create(user_id: user.id, name: "Daniel", last_name:
    "Trujillo", birth_date: "Sun, 30 Dec 2018", sex: "Male", phone: 123456,
    residency_status: "Australian Resident", contract_type: "Casual")
puts 'UserProfile created'

study = Study.create(title: "Agronomics")
puts 'Study created'

user_study = UserStudy.create(user_profile_id: user_profile.id, study_id: study.id,
  status: "Completed", study_type:"Master", start_date: "2005-01-15", end_date:
"2010-12-15")
puts 'UserStudy created'

other_study = OtherStudy.create(title: "Stamp Collector")
puts 'OtherStudy created'

user_other_study = UserOtherStudy.create(user_profile_id: user_profile.id,
other_study_id: other_study.id, study_type: "Other", start_date: "2005-01-15",
end_date: "2010-12-15")
puts 'UserOtherStudy created'

language = Language.create(name: "French")
puts 'Language created'

user_language = UserLanguage.create(user_profile_id: user_profile.id, language_id:
language.id, proficiency: 90)
puts 'UserLanguage created'

position = Position.create(title: "Manager")
puts 'Position created'

work_preference = WorkPreference.create(user_profile_id: user_profile.id,
position_id: position.id, objectives: "Something")
puts 'WorkPreference created'

skill = Skill.create(name: "CAD Drawing", logo: "something.html")
puts 'Skill created'

user_skill = UserSkill.create(user_profile_id: user_profile.id, skill_id:
skill.id)
puts 'UserSkill created'

user_experience = UserExperience.create(user_profile_id: user_profile.id,
position_id: position.id, skill_id: skill.id, status: "Finished",
company_name: "Continental", contract_type: "Full Time", description:
"something", start_date: "2005-01-15", end_date: "2010-12-15")
puts 'UserExperience created'

trait = Trait.create(name: "Doer", description: "something")
puts 'Trait created'

user_trait = UserTrait.create(user_profile_id: user_profile.id, trait_id:
  trait.id)
puts 'UserTrait created'

hobby = Hobby.create(name: "Drawing", category: "something")
puts 'Hobby created'

user_hobby = UserHobby.create(user_profile_id: user_profile.id, hobby_id:
  hobby.id)
puts 'UserHobby created'
