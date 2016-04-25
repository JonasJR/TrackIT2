module ApplicationHelper
  def is_active?(link_path)
   current_page?(link_path) ? "active" : ""
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
