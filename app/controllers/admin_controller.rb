class AdminController < ApplicationController
  layout 'admin'

  before_filter :is_admin?

  private
  def is_admin?
    current_user.try(:admin?) ? (true) : ( redirect_to(new_user_session_path) )
  end

end