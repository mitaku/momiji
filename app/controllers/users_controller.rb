class UsersController < ApplicationController
  before_filter :authenticate_user!

  layout 'two_pane'

  has_widgets do |root|
    root << widget('sidebar/user', :sidebar)
  end

  def index
    @users = target_company.users
  end

  def show
    @user = target_company.users.find(params[:id])
  end
end
