class UserProfilesController < ApplicationController
  def show
    @user = current_user
    @profile = @user.user_profile
    @user_studies = @profile.user_studies
    @user_other_studies = @profile.user_other_studies
    @user_languages = @profile.user_languages
    @preferences = @profile.work_preferences
    @skills = @profile.user_skills
    @experiences = @profile.user_experiences
    @traits = @profile.user_traits
    @hobbies = @profile.user_hobbies
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
