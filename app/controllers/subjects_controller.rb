class SubjectsController < ApplicationController

  def new
    @subject = Subject.new
    authorize @subject
  end

  def create
    if current_user.teacher?
      @subject = Subject.new(subject_params)
      @subject.user = current_user
      @subject.save
      if @subject.save
        flash[:notice] = "Votre matière a bien été créée"
        redirect_to dashboard_path
      else
        flash[:alert] = "Une erreur est survenue lors de l'enregistrement de votre matière"
        render :new
      end
    else
      @subject = Subject.new(subject_params)
      @subject.user = current_user
      @subject.save
      if @subject.save
        @room = Room.new
        @room.subject = @subject
        @room.save
        flash[:notice] = "Votre matière a bien été créée"
        # To be changed when mission creation implemented
        redirect_to dashboard_path
      else
        flash[:alert] = "Une erreur est survenue lors de l'enregistrement de votre matière"
        render :new
      end
    end
    authorize @subject
  end



  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
