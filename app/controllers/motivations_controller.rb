class MotivationsController < ActionController::Base

  def create
    session[:return_to] ||= request.referer
    if signed_in?
      unless current_user.try(:company?)
        motivation = Motivation.new(motivation_params)
        motivation.user_id = current_user.id
        motivation.proposal_id = params[:proposal_id]

        if motivation.save
          proposal_name = Proposal.find_by(id: motivation.proposal_id)
          UserMailer.apply_email(motivation, proposal_name).deliver_now

          redirect_to session.delete(:return_to)
          flash[:success] = "Applied successfully"
        else
          redirect_to session.delete(:return_to)
          flash[:error] = "An error occured, please try again!"
        end
      end
    else
      flash[:error] = "Please log in first"
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def destroy
    session[:return_to] ||= request.referer
    if current_user.try(:teacher)
      motivation = Motivation.find(params[:id])
      proposal_name = Proposal.find_by(id: motivation.proposal_id)
      UserMailer.apply_declined_email(motivation, proposal_name).deliver_now
      motivation.destroy
      redirect_to session.delete(:return_to)
    else
      redirect_to session.delete(:return_to), notice: 'You must be logged in as a teacher to delete motivations.'
    end
  end

  def approve
    session[:return_to] ||= request.referer
    if current_user.try(:teacher)
      motivation = Motivation.find(params[:motivation_id])
      Participant.create(proposal_id: motivation.proposal.id, user_id: motivation.user.id)
      proposal_name = Proposal.find_by(id: motivation.proposal_id)
      UserMailer.apply_approved_email(motivation, proposal_name).deliver_now
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
