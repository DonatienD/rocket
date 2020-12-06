class FlashcardsController < ApplicationController
  before_action :set_info, only: :create

  def create
    @mission = Mission.find(params[:mission_id])
    @flashcard = Flashcard.new(flashcard_params)
    @flashcard.mission = @mission
    @flashcard.user = current_user
    authorize @flashcard
    @flashcard.save
    if @flashcard.save
      flash[:notice] = "Flashcard enregistrée"
      redirect_to mission_path(@mission)
    else
      render 'missions/show'
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    authorize @flashcard
    @mission = @flashcard.mission
    @flashcard.destroy

    redirect_to mission_path(@mission)
  end

  private

  def set_infos
    # This methods allows to render the page when an error occurs \
    # in the flashcard creation (render needs a @chapter and \
    # @flashcards variable).

    @chapter = @flashcard.mission.chapter
    @flashcards = @mission.flashcards
  end

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer)
  end
end
