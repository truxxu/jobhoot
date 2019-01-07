class UserHobbiesController < ApplicationController
  def new
    @hobby = UserHobby.new
  end

  def create
    @hobby = UserHobby.new(hobby_params)
    @hobby.user_profile = current_user.user_profile
    if @hobby.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_hobby_path
      puts @hobby.errors.full_messages
    end
  end

  private

  def hobby_params
    params.require(:user_hobby).permit(:user_profile_id, :name, :category)
  end
end