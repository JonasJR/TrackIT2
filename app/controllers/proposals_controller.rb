class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def new
    @newproposal = Proposal.new
end

end
