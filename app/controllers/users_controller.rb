class UsersController < ApplicationController
  
  #before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end