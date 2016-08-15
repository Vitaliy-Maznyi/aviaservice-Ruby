class Admin::PlanesController < AdminController

  # /admin/:companyname/planes GET
  def index
    @admin_planes = Plane.find_company_name(params[:companyname])
  end

  # /admin/:companyname/planes/:id GET
  def show
    @admin_planes = Plane.find_company_name(params[:companyname]).take
  end

  # /admin/:companyname/planes/new GET
  def new
    @admin_planes = Plane.new
  end

  # /admin/:companyname/planes/:id/edit GET
  def edit
    @admin_planes = Plane.find(params[:id])
  end

  # /admin/:companyname/planes POST
  def create
    @admin_planes = Plane.new(plane_params)
    @admin_planes.company_id = Plane.find_company_name(params[:companyname]).take.company_id
    @admin_planes.save ? (redirect_to admin_planes_path(params[:companyname])) : (flash.now[:danger] = 'You have to fill all fields'; render 'new')
  end

  # /admin/:companyname/planes/:id PUT
  def update
    @admin_planes = Plane.find(params[:id])
    @admin_planes.update(plane_params) ? (redirect_to admin_planes_path(params[:companyname]) ) : (flash.now[:danger] = 'You have to fill all fields'; render 'edit')
  end

  # /admin/:companyname/planes/:id DELETE
  def destroy
    @admin_planes = Plane.find(params[:id])
    @admin_planes.destroy
    redirect_to action: "index"
  end

  private
  def plane_params
    params.require(:plane).permit(:number, :econom_seats, :business_seats)
  end
end
