class ChaptersController < ApplicationController
   def new
    @chapter = Chapter.new
    authorize @chapter
  end

  def create
    @chapter = Chapter.new
    @chapter.user = current_user(chapter_params)
    @chapter.save
    if @chapter.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @chapter
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name)
  end
end
