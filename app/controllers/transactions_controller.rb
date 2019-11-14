class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(params_transaction)
    @transaction.user = current_user
    grandma = Grandma.find(params[:grandma_id])
    @transaction.grandma = grandma
    if @transaction.save
      redirect_to grandma_path(grandma)
    else
      render 'grandma/show'
    end
  end

  private

  def params_transaction
    params.require(:transaction).permit(:rentaldate)
  end
end
