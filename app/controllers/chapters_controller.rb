class ChaptersController < ApplicationController
   before_action :set_room

   def new
    @chapter = Chapter.new
    @chapter.room = @room
    authorize @chapter
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.user = current_user
    @chapter.room = @room
    @chapter.subject = @room.subject
    @chapter.save
    if @chapter.save
      redirect_to room_path(@room)
    else
      render :new
    end
    authorize @chapter
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def chapter_params
    params.require(:chapter).permit(:name)
  end
end
