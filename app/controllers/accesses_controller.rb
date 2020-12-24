class AccessesController < ApplicationController

  def new
    @access = Access.new
    authorize @access
  end

  def create
    @access = Access.new(access_params)
    @access.user = current_user
    authorize @access
    # Check whether student hasn't already joined room
    if current_user.accesses.where(room_id: params[:access][:room_id]).present?
      redirect_to dashboard_path
      flash[:alert] = "Vous avez déjà rejoint cette classe."
      # Check whether room exists
    elsif !Room.where(id: params[:access][:room_id]).present?
      redirect_to dashboard_path
      flash[:alert] = "Cette classe n'existe pas."
      # Save access
    else
      @access.save
      if @access.save
        redirect_to dashboard_path
      else
        render :new
      end
    end
  end

  def destroy
    @access = Access.find(params[:id])
    authorize @access
    @access.destroy

    redirect_to dashboard_path
  end

  private

  def access_params
    params.require(:access).permit(:room_id)
  end
end
