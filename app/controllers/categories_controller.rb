class CategoriesController < ApplicationController
  include Apotomo::Rails::ControllerMethods

  layout 'two_pane'

  before_filter :authenticate_user!
  before_filter :set_categories, :only => [:index]
  before_filter :set_category, :only => [:show, :edit, :update, :destroy]

  has_widgets do |root|
    root << widget(:category_sidebar, :sidebar)
  end

  # GET /categories
  # GET /categories.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    new_category

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    new_category(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to [target_company.to_company, @category], notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to [target_company.to_company, @category], notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def set_categories
    @categories = Category.all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def new_category(attributes = {})
    @category = Category.new(attributes)
  end
end
