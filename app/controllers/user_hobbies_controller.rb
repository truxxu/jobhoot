class UserHobbiesController < ApplicationController
  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @hobby = UserHobby.new
  end

  def index
    @hobby = UserHobby.where(params[:user_profile_id])
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @hobby = UserHobby.new(hobby_params)
    @hobby.user_profile = current_user.user_profile
    if @hobby.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Hobby Added"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @hobby.errors.full_messages
    end
  end

  def destroy
    @hobby = UserHobby.find(params[:id])
    @hobby.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Hobby Removed"
  end

  def edit
    @profile = UserProfile.find(params[:user_profile_id])
    @hobby = UserHobby.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:user_profile_id])
    @hobby = UserHobby.find(params[:id])
    @hobby.update(hobby_params)
    if @hobby.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Hobby Updated"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @hobby.errors.full_messages
    end
  end

  private

  def hobby_params
    params.require(:user_hobby).permit(:user_profile_id, :name, :category)
  end
end
