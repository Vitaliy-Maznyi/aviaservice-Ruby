class Company::OrdersController < CompanyController
  def index
    @company_orders = Order.joins(:flight).where("flights.company_id = ?", @company.id)
  end
end
