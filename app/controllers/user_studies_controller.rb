class UserStudiesController < ApplicationController
  def show
    @study = UserStudy.where(params[:user_profile_id])
  end

  def new
    @study = UserStudy.new
  end

  def create
    @study = UserStudy.new(study_params)
    @study.user_profile = current_user.user_profile
    if @study.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Study Added"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_study_path
      puts @study.errors.full_messages
    end
  end

  def destroy
    @study = UserStudy.find(params[:id])
    @study.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Study Removed"
  end

  def edit
    @study = UserStudy.find(params[:id])
  end

  def update
    @study = UserStudy.find(params[:id])
    @study.update(study_params)
    if @study.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Study Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_study_path
      puts @study.errors.full_messages
    end
  end

  private

  def study_params
    params.require(:user_study).permit(:user_profile_id, :study_id, :status,
                                       :study_type, :start_date, :end_date)
  end
end
