class UsersController < ApplicationController


  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
    @user = current_user

    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
