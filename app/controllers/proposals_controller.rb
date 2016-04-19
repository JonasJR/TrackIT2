class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def new
    @newproposal = Proposal.new

    def create
      @newproposal = Proposal.new(params)

end

end
