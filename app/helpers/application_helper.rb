module ApplicationHelper

  def admin?
    user_signed_in? && current_user.is_admin
  end

end
