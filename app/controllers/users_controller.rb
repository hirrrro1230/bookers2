class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to users_path.id
  end
  
  def index
    @users = User.all
    @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
