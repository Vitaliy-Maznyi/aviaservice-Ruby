class OrdersController < ApplicationController

  # flights/:flight_id/orders/new GET
  def new
    redirect_to root_path, notice: 'You have to be signed in to book a ticket' unless signed_in?
    @flight = Flight.find(params[:flight_id])
    @order = Order.new
  end

  # flights/:flight_id/orders POST
  def create
    @flight = Flight.find(params[:flight_id])
    @order = @flight.orders.create(order_params)
    @order.user_id = current_user.id
    @order.save ? (redirect_to root_path, success: 'tickets were ordered successfully' ) : (render 'new')
  end

  private
  def order_params
    params.require(:order).permit(:econom_seats, :business_seats, :price)
  end

end
