class Company::PlanesController < CompanyController
  def index
    @company_planes = Plane.where(company_id: @company.id)
  end

  def show
    @company_planes = Plane.where({ id: params[:id], company_id: @company.id }).take
  end

  def new
    @company_planes = Plane.new
  end

  def edit
    @company_planes = Plane.find(params[:id])
  end

  def create
    @company_planes = Plane.new(plane_params)
    @company_planes.company_id = @company.id
    @company_planes.save ? (redirect_to action: "index") : (render 'new')
  end

  def update
    @company_planes = Plane.find(params[:id])
    @company_planes.update(plane_params) ? (redirect_to action: "index") : (render 'edit')
  end

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
