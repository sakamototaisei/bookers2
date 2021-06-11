class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @book = Book.new
    @user = current_user
  end

  def show
    @group = Group.find(params[:id])
    @book_new = Book.new
    @user = @group.user
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, user_ids: [] )
  end
end
