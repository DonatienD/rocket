class SubjectsController < ApplicationController

  def new
    @subject = Subject.new
    authorize @subject
  end

  def create
    @subject = Subject.new
    @subject.user = current_user(subject_params)
    @subject.save
    if @subject.save
      if current_user.teacher?
        redirect_to dashboard_path
      else
        # To be changed when mission creation implemented
        redirect_to dashboard_path
      end
    else
      render :new
    end
    authorize @subject
  end



  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
