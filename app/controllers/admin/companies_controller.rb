class Admin::CompaniesController < AdminController

  # /admin GET
  def index
    @companies = Company.all.order("name ASC")
  end
end
