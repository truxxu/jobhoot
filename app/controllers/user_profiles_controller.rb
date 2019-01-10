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
    time_delta = Time.now.to_i - @profile.birth_date.to_i
    @age = time_delta / 31_557_600 # seconds in a year
    @origin_country = country_name(@profile.origin_country)
    @residence_country = country_name(@profile.residence_country)
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

  def edit
    @profile = UserProfile.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Profile Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_profile_path
      puts @profile.errors.full_messages
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:user_id, :name, :last_name, :photo,
                                         :birth_date, :residency_status, :sex,
                                         :phone, :photo_cache, :origin_country,
                                         :residence_country, :address)
  end

  def country_name(country_code)
    CountryStateSelect.countries_collection.to_h.key(country_code.to_sym)
  end
end
