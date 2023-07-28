class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @user_photo = @user.photo.attached? ? @user.photo : 'photo-1508921912186-1d1a45ebb3c1.jpg'
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo)
  end
end
