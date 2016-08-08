class OrdersController < ApplicationController


  def new
    @flight = Flight.find(params[:flight_id])
    @order = Order.new
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @order = @flight.orders.create(order_params)
    @order.user_id = current_user.id if current_user
    @order.save ? (redirect_to root_path, notice: 'tickets were ordered successfully') : (render 'new')
  end

  private
  def order_params
    params.require(:order).permit(:econom_seats, :business_seats, :price)
  end

end
