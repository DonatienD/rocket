class AccessesController < ApplicationController

  def new
    @access = Access.new
    authorize @access
  end

  def create
    @access = Access.new(access_params)
    @access.user = current_user
    authorize @access
    @access.save
    if @access.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def access_params
    params.require(:access).permit(:room_id)
  end
end
