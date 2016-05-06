class RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  def after_sign_up_path_for(resource)
    flash[:warning] = "Please edit your profile information in the top right hand corner!"
    root_url
  end

  private

    def sign_up_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
    end
end
