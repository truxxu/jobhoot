class WorkPreferencesController < ApplicationController
  def new
    @preference = WorkPreference.new
  end

  def create
    @preference = WorkPreference.new(preference_params)
    @preference.user_profile = current_user.user_profile
    if @preference.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Preference Added"
    else
      flash[:alert] = "Please verify the following information:"
      render new_work_preference_path
      puts @preference.errors.full_messages
    end
  end

  def destroy
    @preference = WorkPreference.find(params[:id])
    @preference.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Preference Removed"
  end

  def edit
    @preference = WorkPreference.find(params[:id])
  end

  def update
    @preference = WorkPreference.find(params[:id])
    @preference.update(preference_params)
    if @preference.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Preference Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render new_work_preference_path
      puts @preference.errors.full_messages
    end
  end

  private

  def preference_params
    params.require(:work_preference).permit(:user_profile_id, :study_id,
                                            :objectives, :contract_type)
  end
end
