class Company::FlightsController < CompanyController

  # /company/flights GET
  def index
    @company_flights = Flight.where(company_id: @company.id)
  end

  # /company/flights/new GET
  def new
    @company_flights = Flight.new
  end

  # /company/flights/:id/edit GET
  def edit
    @company_flights = Flight.find(params[:id])
  end

  # /company/flights POST
  def create
    @company_flights = Flight.new(flight_params)
    @company_flights.company_id = @company.id
    @company_flights.save ? (redirect_to action: "index") : (render 'new')
  end

  # /company/flights/:id PUT
  def update
    @company_flights = Flight.find(params[:id])
    @company_flights.update(flight_params) ? (redirect_to action: "index") : (render 'edit')
  end

  # /company/flights/:id DELETE
  def destroy
    @company_flights = Flight.find(params[:id])
    @company_flights.destroy
    redirect_to action: "index"
  end

  private
  def flight_params
    params.require(:flight).permit(:number, :from, :destination, :departure, :arrival, :econom_price, :business_price, :company_id, :plane_id)
  end
end
