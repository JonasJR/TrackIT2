class MotivationsController < ActionController::Base

  def create

  end

  def show
  end

  def destroy
    session[:return_to] ||= request.referer
    if current_user.try(:teacher)
      motivation = Motivation.find(params[:id])
      motivation.destroy
      redirect_to session.delete(:return_to)
    else
      redirect_to session.delete(:return_to), notice: 'You must be logged in as i teacher to delete motivations.'
    end
  end

  def approve
    session[:return_to] ||= request.referer
    if current_user.try(:teacher)
      motivation = Motivation.find(params[:motivation_id])
      Participant.create(proposal_id: motivation.proposal.id, user_id: motivation.user.id)
      motivation.destroy
      redirect_to session.delete(:return_to)
    else
       redirect_to session.delete(:return_to), notice: 'You must be logged in as i teacher to add participants.'
    end
  end

  private

    def motivation_params
      params.require(:motivation).permit(:motivation)
    end

    def check_teacher!
    end

end
