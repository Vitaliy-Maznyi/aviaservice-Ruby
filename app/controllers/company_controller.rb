class CompanyController < ApplicationController

  before_action :authenticate_user!, :is_company?, :current_company

  private
  def is_company?
    redirect_to(new_user_session_path) unless current_user.company.present?
  end

  def current_company
    @company = Company.where(user_id: current_user.id).take
  end
end
