require_dependency "chocoholic/application_controller"

module Chocoholic
  class HandoutsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :set_directory
    before_filter :set_handout, :only => [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @handout.update_attributes(params[:handout])
          format.html { redirect_to content_path(@directory), notice: 'Handout was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @handout.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @content = @directory.build_handout(params[:content])

      respond_to do |format|
        if @content.save
          format.html { redirect_to content_path(@directory), notice: 'Handout was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        else
          raise
        end
      end
    end

    def destroy
      @handout.destroy

      respond_to do |format|
        format.html { redirect_to content_path(@directory) }
        format.json { head :no_content }
      end
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:content_id])
    end

    def set_handout
      @handout = @directory.handouts.find(params[:id])
    end
  end
end
