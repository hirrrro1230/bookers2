class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice:'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books =Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
