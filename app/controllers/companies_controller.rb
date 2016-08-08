class CompaniesController < ApplicationController

  before_action :authenticate_user!, :is_company?

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id if current_user
    @company.save ? (redirect_to root_path) : (render 'new')
  end

  private
  def company_params
    params.require(:company).permit(:name, :country)
  end

  def is_company?
    redirect_to(new_user_session_path) if current_user.company.present?
  end

end
