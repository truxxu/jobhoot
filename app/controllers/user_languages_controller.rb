class UserLanguagesController < ApplicationController
  def new
    @language = UserLanguage.new
  end

  def create
    @language = UserLanguage.new(lang_params)
    @language.user_profile = current_user.user_profile
    if @language.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_language_path
      puts @language.errors.full_messages
    end
  end

  def destroy
    @language = UserLanguage.find(params[:id])
    @language.destroy
    redirect_to user_profile_path(:user_profile_id)
  end

  private

  def lang_params
    params.require(:user_language).permit(:user_profile_id, :language_id,
                                          :proficiency)
  end
end
