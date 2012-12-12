class UsersController < ApplicationController

  layout 'two_pane'

  before_filter :authenticate_user!
  before_filter :set_users, :only => [:index]
  before_filter :set_user, :only => [:show, :edit, :update, :destroy]

  has_widgets do |root|
    root << widget('sidebar/user', :sidebar)
    root << widget('user/password', :password)
  end

  def index
  end

  def show
  end

  def new
    new_user
  end

  def edit
  end

  def create
    new_user(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to [target_company.to_company, @user], notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to [target_company.to_company, @user], notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def set_users
    @users = target_company.users
  end

  def set_user
    @user = target_company.users.find(params[:id])
  end

  def new_user(attributes = {})
    @user = target_company.users.new(attributes)
  end
end
