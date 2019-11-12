class GrandmasController < ApplicationController
  def index
    @grandmas = Grandma.all
  end
end
