class GrandmasController < ApplicationController
  def index

  @grandmas = Grandma.where(competence: params[:grandma][:competence])
    # @grandmas = Grandma.all
  end
end


# User.where(weekly_subscriber: true).find_each do |user|
#   NewsMailer.weekly(user).deliver_now
# end
