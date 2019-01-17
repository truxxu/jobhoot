class UserSkillsController < ApplicationController
  def new
    @skill = UserSkill.new
  end

  def show
    @skill = UserSkill.where(params[:user_profile_id])
  end

  def create
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
