class UserTraitsController < ApplicationController
  def new
    @trait = UserTrait.new
  end

  def create
    @trait = UserTrait.new(trait_params)
    @trait.user_profile = current_user.user_profile
    if @trait.save
      redirect_to user_profile_path(:user_profile_id)
    else
      render new_user_trait_path
      puts @trait.errors.full_messages
    end
  end

  private

  def trait_params
    params.require(:user_trait).permit(:user_profile_id, :trait_id)
  end
end
