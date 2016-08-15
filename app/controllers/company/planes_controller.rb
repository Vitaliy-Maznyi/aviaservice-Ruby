class Company::PlanesController < CompanyController

  # /company/planes GET
  def index
    @company_planes = Plane.where(company_id: @company.id)
  end

  # /company/planes/:id GET
  def show
    @company_planes = Plane.where({ id: params[:id], company_id: @company.id }).take
  end

  # /company/planes/new GET
  def new
    @company_planes = Plane.new
  end

  # /company/planes/:id/edit GET
  def edit
    @company_planes = Plane.find(params[:id])
  end

  # /company/planes POST
  def create
    @company_planes = Plane.new(plane_params)
    @company_planes.company_id = @company.id
    @company_planes.save ? (redirect_to action: "index") : (flash.now[:danger] = 'You have to fill all fields'; render 'new')
  end

  # /company/planes/:id PUT
  def update
    @company_planes = Plane.find(params[:id])
    @company_planes.update(plane_params) ? (redirect_to action: "index") : (flash.now[:danger] = 'You have to fill all fields'; render 'edit')
  end

  # /company/planes/:id DELETE
  def destroy
    @company_planes = Plane.find(params[:id])
    @company_planes.destroy
    redirect_to action: "index"
  end

  private
  def plane_params
    params.require(:plane).permit(:number, :econom_seats, :business_seats)
  end
end
