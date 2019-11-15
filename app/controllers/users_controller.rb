class UsersController < ApplicationController
  def show
    @user = current_user
    @transaction = @user.transactions
  end
end
