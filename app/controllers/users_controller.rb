class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @current_user = current_user
    if params[:id] == "sign_out"
      # Redirect the user to an appropriate page (e.g., root path)
      redirect_to root_path, alert: "Invalid user profile"
    else
      @user = User.find(params[:id])
      # @current_user = current_user # No need for this line
    end
  end
end