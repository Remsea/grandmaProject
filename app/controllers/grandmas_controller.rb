class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]
  def show
    @grandma = Grandma.find(params[:id])
  end

  def index
  @grandmas = Grandma.where(competence_id: params[:competence_id]).geocoded
    # @grandmas = Grandma.geocoded #returns flats with coordinates

    @markers = @grandmas.map do |grandma|
      {
        lat: grandma.latitude,
        lng: grandma.longitude
      }
      # @grandmas = Grandma.all
    end
  end

  def new
    @grandma = Grandma.new
  end

  def create
    @grandma = Grandma.new(params_grandma)
    @grandma.user = current_user
    if @grandma.save
      redirect_to grandma_path(@grandma)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @grandma.update(params_grandma)
      redirect_to @grandma, notice: 'Your Grandma was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grandma = Grandma.find(params[:id])
    @grandma.destroy
    redirect_to '/grandmas', notice: "#{@grandma.name} have been successfully destroyed"
  end

  private

  def params_grandma
    params.require(:grandma).permit(:name, :description, :price, :address, :age, :competence_id, :photo)
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end

