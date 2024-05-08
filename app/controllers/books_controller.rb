class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all.order('created_at DESC')
  end

  def show
    @comment = Comment.new 
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :rating, :price)
  end
end
