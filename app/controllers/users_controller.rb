class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = target_company.users
  end

  def show
    @user = target_company.users.find(params[:id])
  end
end
