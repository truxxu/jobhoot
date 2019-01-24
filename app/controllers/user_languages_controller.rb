class UserLanguagesController < ApplicationController
  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @language = UserLanguage.new
  end

  def index
    @profile = UserProfile.find(params[:user_profile_id])
    @language = UserLanguage.where(user_profile_id: params[:user_profile_id])
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @language = UserLanguage.new(lang_params)
    @language.user_profile = current_user.user_profile
    if @language.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Language Added"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @language.errors.full_messages
    end
  end

  def destroy
    @language = UserLanguage.find(params[:id])
    @language.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Language Removed"
  end

  def edit
    @profile = UserProfile.find(params[:user_profile_id])
    @language = UserLanguage.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:user_profile_id])
    @language = UserLanguage.find(params[:id])
    @language.update(lang_params)
    if @language.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Language Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @language.errors.full_messages
    end
  end

  private

  def lang_params
    params.require(:user_language).permit(:user_profile_id, :language_id,
                                          :proficiency)
  end
end
