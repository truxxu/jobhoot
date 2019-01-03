class UserProfilesController < ApplicationController
  def show
    @user = current_user
    @profile = @user.user_profile
    @studies = @profile.studies
    @user_studies = UserStudy.where(user_profile_id: @profile.id)
    @other_studies = @profile.other_studies
    @user_other_studies = UserOtherStudy.where(user_profile_id: @profile.id)
    @languages = @profile.languages
    @user_languages = UserLanguage.where(user_profile_id: @profile.id)
    @preferences = WorkPreference.where(user_profile_id: @profile.id)
    @skills = @profile.skills
    @positions = @profile.positions
    @experiences = UserExperience.where(user_profile_id: @profile.id)
    @traits = @profile.traits
    @hobbies = @profile.hobbies
  end
end
