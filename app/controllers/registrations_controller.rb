class RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  private

    def sign_up_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
    end
end
