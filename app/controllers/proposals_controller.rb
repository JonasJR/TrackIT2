class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def new
    @newproposal = Proposal.new
end

def create
  proposal = Proposal.new(proposal_params)

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
  params.require(:proposal).permit(:name, :description)
end

end
