module ProposalsHelper
  def correct_user
    user == current_user
  end

  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end
end
