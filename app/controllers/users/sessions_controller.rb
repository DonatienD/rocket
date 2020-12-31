# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # Check whether credientials are correct
    if current_user.present?
      # If user exists...
      # And if user has a profile, allow user to access Dashboard
      if current_user.profile.present?
        #super
        redirect_to dashboard_path
      else
        # Else redirect to profile creation page
        redirect_to new_profile_path
      end
    else
      # If credientials are incorrect (misspelling or not existing),
      # Render sign in with error message
      redirect_to new_user_session_path
      flash[:alert] = "Identifiants incorrects"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
