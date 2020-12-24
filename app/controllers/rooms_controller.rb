class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    authorize @room
    @chapters = @room.chapters
    # Select access linked to room to give ability to quit room
    @access = @room.accesses.where(user_id: current_user.id)[0]
  end

  def new
    @subjects = current_user.subjects
    @room = Room.new
    authorize @room
    @room.level = ""
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    authorize @room
    @room.save
    if @room.save
      # Create a new access (W/out user intervention)
        @access = Access.new
        @access.user = current_user
        @access.room = @room
        @access.save

      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    authorize @room
    @room.destroy

    redirect_to dashboard_path
  end

  private

  def room_params
    params.require(:room).permit(:level, :subject_id)
  end
end
