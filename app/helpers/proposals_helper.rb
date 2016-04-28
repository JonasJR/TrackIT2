module ProposalsHelper
  def correct_user
    user == current_user
  end
end
