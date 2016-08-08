class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @orders = Order.where(user_id: current_user.id).order('created_at DESC')
  end

  def edit
    @user = User.find(current_user.id)
  end
end
