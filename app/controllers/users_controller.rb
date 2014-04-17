class UsersController < ApplicationController
  def index
  end

  private
    def secure_params
      params.require(:user).permit(:name, :email,  :gender,city_attributes: [:name] , state_attributes: [:name], country_attributes: [:name])
    end
end
