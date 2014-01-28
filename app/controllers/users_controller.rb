class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
  	#require(key) Ensures that a parameter is present. If it's present, returns the parameter at the given key, otherwise raises an ActionController::ParameterMissing error.
  	#permit(key[]) Sets the permitted attribute to true. This can be used to pass mass assignment. Returns self.
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
