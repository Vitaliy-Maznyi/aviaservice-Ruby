class Admin::FlightsController < AdminController

  def index
    @admin_flights = Flight.find_company_name(params[:companyname])
  end

  def new
    @admin_flights = Flight.new
  end

  def edit
    @admin_flights = Flight.find(params[:id])
  end

  def create
    @admin_flights = Flight.new(flight_params)
    @admin_flights.company_id = Flight.find_company_name(params[:companyname]).take.company_id
    @admin_flights.save ? (redirect_to action: "index") : (render 'new')
  end

  def update
    @admin_flights = Flight.find(params[:id])
    @admin_flights.update(flight_params) ? (redirect_to action: "index") : (render 'edit')
  end

  def destroy
    @admin_flights = Flight.find(params[:id])
    @admin_flights.destroy
    redirect_to action: "index"
  end

  private
  def flight_params
    params.require(:flight).permit(:number, :from, :destination, :departure, :arrival, :econom_price, :business_price, :company_id, :plane_id)
  end
end