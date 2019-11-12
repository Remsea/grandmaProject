class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]
  def show
    @grandma = Grandma.find(params[:id])
  end

  def index

  @grandmas = Grandma.where(competence_id: params[:grandma][:competence_id])
    # @grandmas = Grandma.all
  end

  def new
    @grandma = Grandma.new
  end

  def create
    @grandma = Grandma.new(params_grandma)
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
    params.require(:grandma).permit(:name, :description, :price, :address, :age, :competence_id)
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end


# User.where(weekly_subscriber: true).find_each do |user|
#   NewsMailer.weekly(user).deliver_now
# end
