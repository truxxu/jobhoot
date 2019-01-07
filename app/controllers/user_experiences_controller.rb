class UserExperiencesController < ApplicationController
  def new
    @experience = UserExperience.new
  end

  def create
    @experience = UserExperience.new(experience_params)
    @experience.user_profile = current_user.user_profile
    if @experience.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_experience_path
      puts @experience.errors.full_messages
    end
  end

  private

  def experience_params
    params.require(:user_experience).permit(:user_profile_id, :position_id,
                                            :status, :company_name,
                                            :contract_type, :description,
                                            :skill_id, :start_date, :end_date)
  end
end
