class Admin::OrdersController < AdminController

  # /admin/:companyname/orders GET
  def index
    @search = Order.ransack(params[:q])
    if params[:q]
      @results = @search.result
      @admin_orders = @results.find_company_name(params[:companyname])
    else
      @admin_orders = Order.find_company_name(params[:companyname])
    end
  end

  # /admin/:companyname/orders/:id DELETE
  def destroy
    @admin_orders = Order.find(params[:id])
    @admin_orders.destroy
    redirect_to action: "index"
  end
end
