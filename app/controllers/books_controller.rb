class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
    @user = current_user
    # @profile_image = user.profile_image_id
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    # @books = Book.all
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end


end
