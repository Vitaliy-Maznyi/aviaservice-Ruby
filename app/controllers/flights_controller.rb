class FlightsController < ApplicationController

  # / GET
  def index
    @search = Flight.ransack(params[:q])
    if params[:q]
      @flights = @search.result
    else
      @flights = Flight.all
    end
  end

end
