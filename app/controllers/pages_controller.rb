class PagesController < ApplicationController
  def home
    @user = current_user
    @profile = @user.user_profile
  end
end
