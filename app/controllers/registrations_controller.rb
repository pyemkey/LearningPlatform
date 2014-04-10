class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  def new
    build_resource({})
    resource.build_city
    resource.build_state
    resource.build_country
    respond_with self.resource
  end

  def create
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :gender, city_attributes: [:name] , state_attributes: [:name], country_attributes: [:name]) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :gender, city_attributes: [:name] , state_attributes: [:name], country_attributes: [:name]) }
  end
end