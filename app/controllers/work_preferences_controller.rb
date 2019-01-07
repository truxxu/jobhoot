class WorkPreferencesController < ApplicationController
  def new
    @preference = WorkPreference.new
  end

  def create
    @preference = WorkPreference.new(preference_params)
    @preference.user_profile = current_user.user_profile
    if @preference.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_work_preference_path
      puts @preference.errors.full_messages
    end
  end

  private

  def preference_params
    params.require(:work_preference).permit(:user_profile_id, :position_id,
                                            :objectives)
  end
end
