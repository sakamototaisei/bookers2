class UsersController < ApplicationController

  # before_action :ensure_correct_user, {only: [:edit, :update]}


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
    # book = current_user.id
  end


  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(
  #     name: params[:name],
  #     email: params[:email],
  #     password: params[:password]
  #     )
  #   if @user.save
  #     session[:user_id] = @user.id
  #     flash[:notice] = "Welcome! You have signed up successfully."
  #   else
  #     render new_user_session
  #   end
  # end

  # def logout
  #   session[:user_id] = nill
  #   flash[:notice] = "Signed out successfully."
  # end




  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to users_path
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

  # def ensure_correct_user
  #   if current_user.id != params[:id].to_i
  #     flash[:notice] = "権限がありません"
  #     redirect_to users_path
  #   end
  # end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
