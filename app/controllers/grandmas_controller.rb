class GrandmasController < ApplicationController
  def show
    @grandma = Grandma.find(params[:id])
  end
end
