class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #, if: :devise_controller?
  # def after_sign_in_path_for(user)
  #   user.demographic_options_empty? ? edit_user_path(user) : root_path
  # end
  
end
