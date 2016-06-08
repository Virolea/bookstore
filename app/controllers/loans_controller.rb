class LoansController < ApplicationController
  before_action :find_book, only: [:new, :create]

  def new
    @users = User.where.not(id: current_user.id).order(username: :asc)
    @loan = Loan.new
    authorize @loan
  end

  def create
    @loan = Loan.new
    @loan.book = @book
    @loan.user = User.find_by_id(loan_params[:user_id])
    @loan.status = "loaned"
    authorize @loan
    if @loan.save
      flash[:notice] = "#{@loan.book.title} loaned to #{@loan.user.username}"
      redirect_to :root
    else
      @users = User.where.not(id: current_user.id).order(username: :asc)
      render :new
    end
  end

  def update
    @loan = Loan.find(params[:id])
    authorize @loan
    if @loan.update(status: "returned")
      flash[:notice] = "#{@loan.book.title} returned to #{@loan.book.user.username}"
      redirect_to :root
    else
      flash[:error] = "Impossible to return book"
      redirect_to :root
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:user_id)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
