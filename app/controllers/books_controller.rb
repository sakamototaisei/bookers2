class BooksController < ApplicationController

  # before_action :ensure_correct_user, {only: [:edit,:update]}

  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
    @user = current_user
  end

  def create
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
    @user = current_user

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      flash[:notice] = "権限がありません"
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  # def ensure_correct_user
  #   @book = Book.find(params[:id])
  #   if current_user.id != @book.user
  #     flash[:notice] = "権限がありません"
  #     redirect_to users_path
  #   end
  # end




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
