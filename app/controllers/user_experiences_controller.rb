class UserExperiencesController < ApplicationController
  def new
    @experience = UserExperience.new
  end

  def create
    @experience = UserExperience.new(experience_params)
    @experience.user_profile = current_user.user_profile
    if @experience.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Experience Added"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_experience_path
      puts @experience.errors.full_messages
    end
  end

  def destroy
    @experience = UserExperience.find(params[:id])
    @experience.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Experience Removed"
  end

  def edit
    @experience = UserExperience.find(params[:id])
  end

  def update
    @experience = UserExperience.find(params[:id])
    @experience.update(experience_params)
    if @experience.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Experience Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_experience_path
      puts @experience.errors.full_messages
    end
  end

  private

  def experience_params
    params.require(:user_experience).permit(:user_profile_id, :study_id,
                                            :status, :company_name,
                                            :contract_type, :description,
                                            :skill_id, :start_date, :end_date)
  end
end
