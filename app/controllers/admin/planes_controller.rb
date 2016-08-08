class Admin::PlanesController < AdminController

  def index
    @admin_planes = Plane.find_company_name(params[:companyname])
  end

  def show
    @admin_planes = Plane.find_company_name(params[:companyname]).take
  end

  def new
    @admin_planes = Plane.new
  end

  def edit
    @admin_planes = Plane.find(params[:id])
  end

  def create
    @admin_planes = Plane.new(plane_params)
    @admin_planes.company_id = Plane.find_company_name(params[:companyname]).take.company_id
    @admin_planes.save ? (redirect_to admin_planes_path(params[:companyname])) : (render 'new')
  end

  def update
    @admin_planes = Plane.find(params[:id])
    @admin_planes.update(plane_params) ? (redirect_to admin_planes_path(params[:companyname]) ) : (render 'edit')
  end

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
