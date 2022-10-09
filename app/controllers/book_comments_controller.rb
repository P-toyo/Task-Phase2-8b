class BookCommentsController < ApplicationController

  def create
    @post_book = Book.find(params[:book_id])
    @books = Book.all
    @book = Book.new
    @user = User.find(@post_book.user_id)
    @book_comment = BookComment.new
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @post_book.id
    comment.save
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    @post_book = Book.find(params[:book_id])
    @books = Book.all
    @book = Book.new
    @user = User.find(@post_book.user_id)
    @book_comment = BookComment.new
    if current_user.id == book_comment.user_id
      BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
