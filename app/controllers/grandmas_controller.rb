class GrandmasController < ApplicationController
  def new
    @grandma = Grandma.new
  end

  def create
    @grandma = Grandma.new(params_grandma)
    if @grandma.save
      redirect_to grandma_path(@grandma)
    else
      render :new
    end
  end

  private

  def params_grandma
    params.require(:grandma).permit(:name, :description, :price, :address, :age, :competence)
  end
end
