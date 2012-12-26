require_dependency "rset_mcm/application_controller"

module RsetMcm
  class ContentsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :set_directory, :only => [:show, :edit, :destroy, :update]

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

    private
    def set_directory
      @directory = target_company.directories.find(params[:id])
    end
  end
end
