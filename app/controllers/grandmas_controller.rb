class GrandmasController < ApplicationController

  def show
    @grandma = Grandma.find(params[:id])
  end
    
  def index
    @grandmas = Grandma.all
  end
end
