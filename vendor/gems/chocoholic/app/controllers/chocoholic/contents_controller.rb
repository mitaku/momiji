require_dependency "chocoholic/application_controller"

module Chocoholic
  class ContentsController < ApplicationController
    before_filter :authenticate_user!

    def root
      @directory = target_company.directories.roots.first
      render :show
    end

    def mkdir
      @directory = target_company.directories.find(params[:id])

      @new_directory = Chocoholic::Directory.new(params[:content])
      @new_directory.parent = @directory
      @new_directory.company_id = @directory.company_id

      respond_to do |format|
        if @new_directory.save
          format.html { redirect_to({:action => :show, :id => @directory.id}, notice: 'Directory was successfully created.' ) }
        end
      end
    end

    def show
      @directory = target_company.directories.find(params[:id])
    end
  end
end
