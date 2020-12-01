class ProfilesController < ApplicationController

  def new
    # If a profile already exists, redirect user to Dashboard
    if !current_user.profile.nil?
      redirect_to dashboard_path
    end
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      if current_user.teacher?
        redirect_to new_subject_path
      else
        redirect_to dashboard_path
      end
    else
      render :new
    end
    authorize @profile
  end

  private

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :gender)
  end
end
