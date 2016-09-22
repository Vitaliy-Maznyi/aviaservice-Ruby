class AdminController < ApplicationController

  before_filter :is_admin?

  private
  def is_admin?
     redirect_to(new_user_session_path) unless current_user.try(:admin?)
  end

end