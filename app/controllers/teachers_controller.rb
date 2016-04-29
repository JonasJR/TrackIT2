class TeachersController < ApplicationController
  def index
  end

  def show
  end

  def approve
    @proposals = Proposal.all
  end
end
