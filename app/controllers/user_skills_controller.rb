class UserSkillsController < ApplicationController
  def new
    @skill = UserSkill.new
  end

  def create
    @skill = UserSkill.new(skill_params)
    @skill.user_profile = current_user.user_profile
    if @skill.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_skill_path
      puts @skill.errors.full_messages
    end
  end

  private

  def skill_params
    params.require(:user_skill).permit(:user_profile_id, :skill_id)
  end
end
