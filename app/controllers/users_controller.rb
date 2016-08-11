class UsersController < ApplicationController

  # /profile GET
  def show
    @user = User.find(current_user.id)
    @orders = Order.where(user_id: current_user.id).order('created_at DESC')
  end

  # /profile GET
  def edit
    @user = User.find(current_user.id)
  end
end
