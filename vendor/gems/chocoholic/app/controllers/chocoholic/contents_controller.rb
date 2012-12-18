require_dependency "chocoholic/application_controller"

module Chocoholic
  class ContentsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :set_directory, :only => [:show, :edit, :destroy, :update, :mkdir]

    has_widgets do |root|
      root << widget("chocoholic/permission", "autocomplete")
    end

    def root
      @directory = target_company.directories.roots.first
      render :show
    end

    def show
    end

    def edit
    end

    def destroy
      raise if @directory.is_root?
      @directory.destroy

      respond_to do |format|
        format.html { redirect_to content_path(@directory.parent) }
        format.json { head :no_content }
      end
    end

    def update
      respond_to do |format|
        if @directory.update_attributes(params[:content])
          format.html { redirect_to content_path(@directory), notice: 'Content was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @directory.errors, status: :unprocessable_entity }
        end
      end
    end

    def mkdir
      @new_directory = @directory.build_directory(params[:content])

      respond_to do |format|
        #TODO Validation
        if @new_directory.save
          format.html { redirect_to({:action => :show, :id => @directory.id}, notice: 'Directory was successfully created.' ) }
        else
          #TODO
          raise
        end
      end
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:id])
    end
  end
end
