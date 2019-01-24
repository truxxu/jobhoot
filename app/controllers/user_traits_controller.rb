class UserTraitsController < ApplicationController
  def new
    @profile = UserProfile.find(params[:user_profile_id])
    @trait = UserTrait.new
  end

  def index
    @trait = UserTrait.where(params[:user_profile_id])
  end

  def create
    @profile = UserProfile.find(params[:user_profile_id])
    @trait = UserTrait.new(trait_params)
    @trait.user_profile = current_user.user_profile
    if @trait.save
      redirect_to user_profile_path(:user_profile_id)
      flash[:notice] = "Personality Trait Added"
    else
      flash[:alert] = "Please verify the following information:"
      render :new
      puts @trait.errors.full_messages
    end
  end

  def destroy
    @trait = UserTrait.find(params[:id])
    @trait.destroy
    redirect_to user_profile_path(:user_profile_id)
    flash[:alert] = "Personality Trait Removed"
  end

  private

  def trait_params
    params.require(:user_trait).permit(:user_profile_id, :trait_id)
  end
end
