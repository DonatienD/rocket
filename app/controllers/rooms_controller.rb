class RoomsController < ApplicationController

  def new
    @subjects = current_user.subjects
    @room = Room.new
    @room.level = ""
    authorize @room
  end

  def create
    raise
    @room = Room.new
    @room.user = current_user(room_params)
    @room.save
    if @room.save
      if current_user.teacher?
        redirect_to dashboard_path
      else
        # To be changed when mission creation implemented
        redirect_to dashboard_path
      end
    else
      render :new
    end
    authorize @room
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
