class SubmitController < ApplicationController
  def index
    @submit = Proposal.new
  end
end
