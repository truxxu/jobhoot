class UserExperiencesController < ApplicationController
  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @experience = UserExperience.new
  end

  def index
    @profile = UserProfile.find(params[:user_profile_id])
    @experience = UserExperience.where(user_profile_id: params[:user_profile_id])
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @experience = UserExperience.new(experience_params)
    @experience.user_profile = current_user.user_profile
    if @experience.check_date? == false
      flash[:alert] = "Please enter a valid date"
      render :new
    elsif @experience.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Experience Added"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
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
    @profile = UserProfile.find(params[:user_profile_id])
    @experience = UserExperience.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:user_profile_id])
    @experience = UserExperience.find(params[:id])
    @experience.update(experience_params)
    if @experience.check_date? == false
      flash[:alert] = "Please enter a valid date"
      render :new
    elsif @experience.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Experience Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @experience.errors.full_messages
    end
  end

  private

  def experience_params
    params.require(:user_experience).permit(:user_profile_id,
                                            :study_id,
                                            :status,
                                            :company_name,
                                            :contract_type,
                                            :description,
                                            :skill_id,
                                            :start_date,
                                            :end_date)
  end
end
