class AdminsController < ApplicationController
  before_action :authenticate

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_update_params)
      flash[:success] = "Attributes where updated"
    else
      flash[:danger] = "Could not update attributes"
    end

    redirect_to admins_path
  end

  private
    def user_update_params
      params.require(:user).permit(:teacher, :admin)
    end

    def authenticate
      unless current_user.admin
        flash[:danger] = "You are not allowed in the admin area"
        redirect_to root_url
      end
    end
end
