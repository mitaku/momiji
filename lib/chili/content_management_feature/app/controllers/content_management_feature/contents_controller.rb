require_dependency "content_management_feature/application_controller"

module ContentManagementFeature
  class ContentsController < ApplicationController

    before_filter :authenticate_user!
    before_filter :set_directory
    before_filter :set_contents, :only => [:index]
    before_filter :set_content, :only => [:show, :edit, :update, :destroy]

    # GET /contents
    # GET /contents.json
    def index
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @contents }
      end
    end

    # GET /contents/1
    # GET /contents/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @content }
      end
    end

    # GET /contents/new
    # GET /contents/new.json
    def new
      @content = @directory.contents.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @content }
      end
    end

    # GET /contents/1/edit
    def edit
    end

    # POST /contents
    # POST /contents.json
    def create
      @content = @directory.contents.new(params[:content])

      respond_to do |format|
        if @content.save
          format.html { redirect_to directory_path(@directory), notice: 'Content was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        else
          format.html { render action: "new" }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /contents/1
    # PUT /contents/1.json
    def update
      respond_to do |format|
        if @content.update_attributes(params[:content])
          format.html { redirect_to @content, notice: 'Content was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /contents/1
    # DELETE /contents/1.json
    def destroy
      @content.destroy

      respond_to do |format|
        format.html { redirect_to directory_path(@directory) }
        format.json { head :no_content }
      end
    end

    private
    def set_directory
      @directory ||= target_company.content_directories.find(params[:directory_id])
    end

    def set_contents
      @contents ||= @directory.contents
    end

    def set_content
      @content ||= @directory.contents.find(params[:id])
    end
  end
end
