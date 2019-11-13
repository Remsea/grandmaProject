class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]
  def show
    @grandma = Grandma.find(params[:id])
  end

  def filtre_loc
    Grandma.near(params[:localisation], 10)
  end

  def index
    if Competence.find(params[:competence_id]).to_s == 'Toutes'
      if params[:localisation].empty?
        @grandmas = Grandma.all
      else
        @grandmas = filtre_loc
      end
    else
      if params[:localisation].empty?
        @grandmas = Grandma.where(competence_id: params[:competence_id])
      else
        @grandmas = filtre_loc.where(competence_id: params[:competence_id])
      end
      # @grandmas = Grandma.geocoded #returns flats with coordinates
    end
    @grandmas.geocoded
    @markers = @grandmas.map do |grandma|
      {
        lat: grandma.latitude,
        lng: grandma.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { grandma: grandma }),
        image_url: helpers.asset_url('grandma.svg')
      }
    end
    redirect_to root_path, notice: 'Sorry no grandma found :(' if @grandmas.empty?
  end

  def new
    @grandma = Grandma.new
    @competences = Competence.where("name <> 'Toutes'")
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
    redirect_to '/', notice: "#{@grandma.name} have been successfully destroyed"
  end

  private

  def params_grandma
    params.require(:grandma).permit(:name, :description, :price, :address, :age, :competence_id, :photo)
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end

