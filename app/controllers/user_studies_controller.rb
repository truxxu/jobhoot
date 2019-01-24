class UserStudiesController < ApplicationController
  def index
    @profile = UserProfile.find(params[:user_profile_id])
    @study = UserStudy.where(user_profile_id: params[:user_profile_id])
  end

  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @study = UserStudy.new
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @study = UserStudy.new(study_params)
    @study.user_profile = current_user.user_profile
    if @study.check_date? == false
      flash[:alert] = "Please enter a valid date"
      render :new
    elsif @study.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Study Added"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
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
    @profile = UserProfile.find(params[:user_profile_id])
    @study = UserStudy.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:user_profile_id])
    @study = UserStudy.find(params[:id])
    @study.update(study_params)
    if @study.check_date? == false
      flash[:alert] = "Please enter a valid date"
      render :new
    elsif @study.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Study Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @study.errors.full_messages
    end
  end

  private

  def study_params
    params.require(:user_study).permit(:user_profile_id, :study_id, :status,
     :study_type, :start_date, :end_date)
  end
end
