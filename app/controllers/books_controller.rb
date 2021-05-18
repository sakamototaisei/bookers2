class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
