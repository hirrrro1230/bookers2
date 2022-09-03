class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @user = current_user
  end

  def edit
  end
end
