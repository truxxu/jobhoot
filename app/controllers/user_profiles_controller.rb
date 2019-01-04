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

  def new
    @profile = UserProfile.new
  end

  def create
    @profile = UserProfile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to user_profile_path(:id)
    else
      render new_user_profile_path
      puts @profile.errors.full_messages
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:user_id, :name, :last_name, :photo,
                                         :birth_date, :sex, :phone, :photo_cache)
  end
end
