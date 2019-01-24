class UserSkillsController < ApplicationController
  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @skill = UserSkill.new
  end

  def index
    @profile = UserProfile.find(params[:user_profile_id])
    @skill = UserSkill.where(user_profile_id: params[:user_profile_id])
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @skill = UserSkill.new(skill_params)
    @skill.user_profile = current_user.user_profile
    if @skill.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Skill Added"
    else
      flash[:alert] = "Please verify the following information:"
      render new_user_skill_path
      puts @skill.errors.full_messages
    end
  end

  def destroy
    @skill = UserSkill.find(params[:id])
    @skill.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Skill Removed"
  end

  private

  def skill_params
    params.require(:user_skill).permit(:user_profile_id, :skill_id)
  end
end
