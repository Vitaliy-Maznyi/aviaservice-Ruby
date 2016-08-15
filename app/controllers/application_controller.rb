class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def layout_by_resource
    if devise_controller? || (request.fullpath.include? '/companies')
      'devise_sign' #layout for sign in/sign up pages
    elsif request.fullpath.include? '/admin'
      'admin'
    elsif request.fullpath.include? '/company'
      'company'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in)        << :name
    devise_parameter_sanitizer.for(:sign_up)        << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
