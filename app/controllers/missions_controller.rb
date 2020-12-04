class MissionsController < ApplicationController
  before_action :set_chapter, only: [:new, :create]

  def show
    @mission = Mission.find(params[:id])
    @chapter = @mission.chapter

    # Set created date to European format
    @date = @mission.created_at
    @creation_date = "#{@date.day}.#{@date.month}.#{@date.year}"

    authorize @mission
  end

  def new
    @mission = Mission.new
    @mission.chapter = @chapter
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @mission.chapter = @chapter
    @mission.save
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
    authorize @mission
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def mission_params
    params.require(:mission).permit(:name)
  end
end
