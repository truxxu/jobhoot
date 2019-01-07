class UserOtherStudiesController < ApplicationController
  def new
    @study = UserOtherStudy.new
  end

  def create
    @study = UserOtherStudy.new(study_params)
    @study.user_profile = current_user.user_profile
    if @study.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_other_study_path
      puts @study.errors.full_messages
    end
  end

  private
  def study_params
    params.require(:user_other_study).permit(:user_profile_id, :other_study_id,
                                             :study_type, :start_date, :end_date)
  end
end
