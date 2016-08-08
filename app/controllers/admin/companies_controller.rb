class Admin::CompaniesController < AdminController
  def index
    @companies = Company.all.order("name ASC")
  end
end
