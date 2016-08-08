class Company::FlightsController < CompanyController

  def index
    @company_flights = Flight.where(company_id: @company.id)
  end

  def new
    @company_flights = Flight.new
  end

  def edit
    @company_flights = Flight.find(params[:id])
  end

  def create
    @company_flights = Flight.new(flight_params)
    @company_flights.company_id = @company.id
    @company_flights.save ? (redirect_to action: "index") : (render 'new')
  end

  def update
    @company_flights = Flight.find(params[:id])
    @company_flights.update(flight_params) ? (redirect_to action: "index") : (render 'edit')
  end

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
