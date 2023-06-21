class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    authorize @user, policy_class: ProfilePolicy
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
