class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      flash[:notice] = "Successfully added #{@book.title} to your collection"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @book
  end

  def update
    authorize @book
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    authorize @book
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
