class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]
  def show
    @grandma = Grandma.find(params[:id])
  end

  def index
    @grandmas = Grandma.all
  end

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

  def edit
  end

  def update
    if @grandla.update(grandma_params)
      redirect_to @grandma, notice: 'Your Grandma was successfully updated.'
    else
      render :edit
    end
  end

  private

  def params_grandma
    params.require(:grandma).permit(:name, :description, :price, :address, :age, :competence)
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end
