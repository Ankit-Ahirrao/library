module ApplicationHelper

  def admin?
    user_signed_in? && current_user.is_admin
  end

  def current_user?(user)
    user && user == current_user
  end

  
end
