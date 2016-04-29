class ProposalsController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def index
    @proposals = Proposal.all
  end

  def new
    @newproposal = Proposal.new
  end

  def edit
    @editproposal = Proposal.find(params[:id])
  end

  def approved
    @approvedproposal = Proposal.find(params[:id])
    @approvedproposal.approved = true
    @approvedproposal.save
    redirect_to teachers_approve_url
  end

  def destroy
    @deleteproposal = Proposal.find(params[:id])
    @deleteproposal.destroy
    redirect_to teachers_approve_url
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      redirect_to root_url
      flash[:success] = "Proposal edited with no errors"
    else
      render 'edit'
      flash[:error] = "An error occured, please try again!"
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

def create
  proposal = current_user.proposals.build(proposal_params)
  proposal.approved = false

if proposal.save
  redirect_to root_url
  flash[:success] = "Proposal submited with no errors"
else
  render :new
  flash[:error] = "An error occured, please try again!"
end
end

private

  def proposal_params
    params.require(:proposal).permit(:name, :description, :category, :course)
  end

  def authenticate
    unless signed_in?
      flash[:error] = "Please log in first"
      redirect_to new_user_session_path
    end
  end

end
