require_dependency "chocoholic/application_controller"

module Chocoholic
  class HandoutsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :set_directory
    before_filter :set_handout, :only => [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
    end

    def create
      @content = @directory.build_handout(params[:content])

      respond_to do |format|
        if @content.save
          format.html { redirect_to content_path(@directory), notice: 'Handout was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        end
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
