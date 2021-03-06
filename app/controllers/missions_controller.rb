class MissionsController < ApplicationController
  before_action :set_chapter, only: [:new, :create]
  before_action :set_mission, only: [:play, :edit, :update, :destroy]

  def show
    @mission = Mission.find(params[:id])
    @chapter = @mission.chapter
    authorize @mission
    @flashcard = Flashcard.new
    @flashcards = @mission.flashcards

    # Set created date to European format
    @date = @mission.created_at
    @creation_date = "#{@date.day}.#{@date.month}.#{@date.year}"
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
    authorize @mission
    @mission.save
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def play
    @chapter = @mission.chapter
    authorize @mission
    @flashcards = @mission.flashcards
  end

  def edit
    authorize @mission
  end

  def update
    authorize @mission
    @mission.update(mission_params)

    redirect_to mission_path(@mission)
  end

  def destroy
    authorize @mission
    @chapter = @mission.chapter
    @mission.destroy
    redirect_to room_path(@chapter.room)
    flash[:notice] = "La mission a bien été supprimée"
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:name)
  end
end
