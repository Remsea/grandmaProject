class PagesController < ApplicationController
  def home
    @grandma = Grandma.new
    @grandmas = Grandma.all.sample(3)
  end
end
