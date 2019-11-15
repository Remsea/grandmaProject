class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]
  def show
    @grandma = Grandma.find(params[:id])
  end

  def filtre_loc
    Grandma.near(params[:localisation], 10)
  end

  def filtre_date
    # where not ((t.id IS NOT NULL) AND (t.rentaldate >= '10/10/2019' and t.rentaldate <= '12/12/2019'))
    sql_query = " \
    (transactions.rentaldate >= :start_date \
    AND transactions.rentaldate <= :end_date) \
    AND (transactions.id IS NOT NULL) \
    "
    if params[:localisation].empty?
      if Competence.find(params[:competence_id]).to_s == 'Toutes'
        Grandma.left_outer_joins(:transactions)
               .where.not(sql_query, start_date: params[:start_date], end_date: params[:end_date])
               .distinct
      else
        Grandma.left_outer_joins(:transactions)
               .where.not(sql_query, start_date: params[:start_date], end_date: params[:end_date])
               .where(competence_id: params[:competence_id])
               .distinct
      end
    else
      if Competence.find(params[:competence_id]).to_s == 'Toutes'
        filtre_loc.left_outer_joins(:transactions)
                  .where.not(sql_query, start_date: params[:start_date], end_date: params[:end_date])
                  .distinct
      else
        filtre_loc.left_outer_joins(:transactions)
                  .where.not(sql_query, start_date: params[:start_date], end_date: params[:end_date])
                  .where(competence_id: params[:competence_id])
                  .distinct
      end
    end
  end

  def index
    if params[:start_date].present?
      @grandmas = filtre_date
      @date = [params[:start_date], params[:end_date]]
      byebug
    else
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
      end
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
    @competences = Competence.where("name <> 'Toutes'")
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

