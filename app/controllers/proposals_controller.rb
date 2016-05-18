class ProposalsController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def index
    unless params[:search]
      @proposals = Proposal.approved.order("created_at desc").paginate(page: params[:page], per_page: 10)
    else
      @proposals = Proposal.search(params[:search]).order("created_at desc").paginate(:per_page => 10, :page => params[:page])
    end
    if signed_in?
      @myproposals = current_user.proposals
    end
  end

  def new
    @newproposal = Proposal.new
    @page = params[:page]
  end

  def edit
    @editproposal = Proposal.find(params[:id])
    unless (current_user.id == @editproposal.user_id) or (current_user.try(:teacher?))
      flash[:error] = "You are not allowed to edit this!"
      redirect_to proposal_url(@editproposal)
    end
  end

  def approve
    @proposals = Proposal.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  def approved
    if current_user.try(:teacher?)
      @approvedproposal = Proposal.find(params[:id])
      @approvedproposal.approved = true
      @approvedproposal.save

      UserMailer.approved_email(current_user.name, @approvedproposal).deliver_now

      flash[:success] = "Proposal approved!"
      redirect_to proposals_approve_path
    else
      flash[:error] = "Error, you don't have permission to approve"
      redirect_to root_url
    end
  end

  def destroy
    if (current_user.try(:teacher?)) or (@proposal.user_id == current_user.id)
      unless (current_user.try(:teacher?)) and (!@proposal.approved?)
        flash[:error] = "Error, you don't have permission to remove at this stage"
        redirect_to root_url
      else
        session[:return_to] ||= request.referer
        @deleteproposal = Proposal.find(params[:id])
        UserMailer.declined_email(current_user.name, @deleteproposal).deliver_now
        @deleteproposal.destroy
        flash[:success] = "Proposal removed!"
        redirect_to session.delete(:return_to)
      end
    else
      flash[:error] = "Error, you don't have permission to remove"
      redirect_to root_url
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    if (current_user.try(:teacher?)) or (@proposal.user_id == current_user.id)
      if @proposal.update_attributes(proposal_params)
        redirect_to proposal_url(@proposal)
        flash[:success] = "Proposal edited with no errors"
      else
        render 'edit'
        flash[:error] = "An error occured, please try again!"
      end
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    @username = @proposal.user.email
    @all_motivations = Motivation.where(proposal_id: params[:id])
    @motivation =  @proposal.motivations.build
    @participants = @proposal.participants
  end

def create
  if signed_in?
    @proposal = current_user.proposals.build(proposal_params)
    @proposal.approved = false

    if @proposal.save
      redirect_to proposals_url
      UserMailer.proposal_submitted(@proposal).deliver_now
      flash[:success] = "Proposal submited with no errors"
    else
      render :new
      flash[:error] = "An error occured, please try again!"
    end
  else
    flash[:error] = "Please log in first"
    redirect_to new_user_session_path
  end
end

private

  def proposal_params
    params.require(:proposal).permit(:name, :description, :category, :course, :vsc_url, :project_managment_service)
  end

  def authenticate
    unless signed_in?
      flash[:error] = "Please log in first"
      redirect_to new_user_session_path
    end
  end

end
