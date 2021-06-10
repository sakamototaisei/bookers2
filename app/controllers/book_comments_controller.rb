class BookCommentsController < ApplicationController

  before_action :comment_params

  def create
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    render :show
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    render :show
  end


  private

  def comment_params
     @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
