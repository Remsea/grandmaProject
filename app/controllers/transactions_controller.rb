class TransactionsController < ApplicationController
  def create
    @grandma = Grandma.find(params[:grandma_id])
    @transactions = @grandma.transactions.pluck(:rentaldate)
    @transactions.map! do |date|
      date.strftime("%d %m %y")
    end
    if (params[:rentaldate] == '') || (Date.parse(params[:rentaldate]) < Date.current)
      flash.now[:alert] = 'Dates vides ou dans le passée! 🧐'
      render 'grandmas/show'
    else
      @test = @transactions.include?(Date.parse(params[:rentaldate]).strftime("%d %m %y")) unless @transactions.nil?
      if @test
        flash.now[:alert] = 'Date déjà prise pour Mamie sorry'
        render 'grandmas/show'
      else
        @transaction = Transaction.new(params_transaction)
        @transaction.user = current_user
        @transaction.grandma = @grandma
        if @transaction.save
          redirect_to grandma_path(@grandma), notice: "Mamie bien réservée!"
        else
          flash.now[:alert] = @transaction.errors.full_messages.to_s
          render 'grandmas/show'
        end
      end
    end
  end

  def show
    @transaction = Transaction.find(params_transaction)
  end

  private

  def params_transaction
    {
      rentaldate: params[:rentaldate]
    }
  end
end
