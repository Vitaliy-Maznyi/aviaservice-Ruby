class Admin::FlightsController < AdminController

  # /admin/:companyname/flights GET
  def index
    @admin_flights = Flight.find_company_name(params[:companyname])
  end

  # /admin/:companyname/flights/new GET
  def new
    @admin_flights = Flight.new
  end

  # /admin/:companyname/flights/:id/edit GET
  def edit
    @admin_flights = Flight.find(params[:id])
  end

  # /admin/:companyname/flights POST
  def create
    @admin_flights = Flight.new(flight_params)
    @admin_flights.company_id = Flight.find_company_name(params[:companyname]).take.company_id
    @admin_flights.save ? (redirect_to action: 'index') : (flash.now[:danger] = 'You have to fill all fields'; render 'new')
  end

  # /admin/:companyname/flights/:id PUT
  def update
    @admin_flights = Flight.find(params[:id])
    @admin_flights.update(flight_params) ? (redirect_to action: 'index') : (flash.now[:danger] = 'You have to fill all fields'; render 'edit')
  end

  # /admin/:companyname/flights/:id DELETE
  def destroy
    @admin_flights = Flight.find(params[:id])
    @admin_flights.destroy
    redirect_to action: 'index'
  end

  private
  def flight_params
    params.require(:flight).permit(:number, :from, :destination, :departure, :arrival, :econom_price, :business_price, :company_id, :plane_id)
  end
end
