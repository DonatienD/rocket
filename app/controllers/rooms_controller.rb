class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @chapters = @room.chapters
    authorize @room
  end

  def new
    @subjects = current_user.subjects
    @room = Room.new
    @room.level = ""
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @room.save
    if @room.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @room
  end

  private

  def room_params
    params.require(:room).permit(:level, :subject_id)
  end
end
