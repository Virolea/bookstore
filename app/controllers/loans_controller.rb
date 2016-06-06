class LoansController < ApplicationController
  before_action :find_book, only: [:new, :create]

  def new
    @users = User.where.not(id: current_user.id)
    @loan = Loan.new
    authorize @loan
  end

  def create
    @loan = Loan.new
    @loan.book = @book
    @loan.user = User.find(loan_params[:user_id])
    @loan.status = "loaned"
    authorize @loan
    if @loan.save
      redirect_to :root
    else
      render :new
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
