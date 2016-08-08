class Companies::FlightsController < ApplicationController
  def index
    @company = Company.where(name: params[:company_companyname]).take
  end
end
