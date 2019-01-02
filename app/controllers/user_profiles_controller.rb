class UserProfilesController < ApplicationController
  def show
    @user = current_user
    @profile = current_user.user_profile
  end
end
