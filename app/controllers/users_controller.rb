class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
    @user.city = City.new
    @user.state = State.new
    @user.country = Country.new
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    if @user.update_attributes(secure_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def secure_params
      params.require(:user).permit(:name, :email,  :gender,city_attributes: [:name] , state_attributes: [:name], country_attributes: [:name])
    end
end
