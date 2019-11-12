class PagesController < ApplicationController
  def home
    @grandma = Grandma.new
  end
end
