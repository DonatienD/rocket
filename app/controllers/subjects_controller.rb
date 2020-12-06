class SubjectsController < ApplicationController

  def new
    @subject = Subject.new
    authorize @subject
  end

  def create
    if current_user.teacher?
      @subject = Subject.new(subject_params)
      @subject.user = current_user
      authorize @subject
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
      authorize @subject
      @subject.save
      if @subject.save
        # Create a new room (W/out user intervention)
        @room = Room.new
        @room.subject = @subject
        @room.user = current_user
        @room.save

        # Create a new access (W/out user intervention)
        @access = Access.new
        @access.user = current_user
        @access.room = @room
        @access.save

        flash[:notice] = "Votre matière a bien été créée"
        # To be changed when mission creation implemented
        redirect_to dashboard_path
      else
        flash[:alert] = "Une erreur est survenue lors de l'enregistrement de votre matière"
        render :new
      end
    end
  end



  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
