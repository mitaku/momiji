require_dependency "content_management_feature/application_controller"

module ContentManagementFeature
  class DirectoriesController < ApplicationController
    before_filter :authenticate_user!

    before_filter :set_directory, :only => [:show, :edit, :update, :destroy, :ls, :mkdir]

    def show
      @children = @directory.children
    end

    def edit
    end

    def mkdir
      @new_directory = @directory.children.new(params[:directory])
      @new_directory.company = @directory.company

      respond_to do |format|
        if @new_directory.save
          format.html { redirect_to({:action => :ls, :id => @directory.id}, notice: 'User was successfully created.' ) }
          format.json { render json: @new_directory, status: :created, location: @new_directory }
        else
          format.json { render json: @new_directory.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @directory.update_attributes(params[:directory])
          format.html { redirect_to [target_company.to_company, @directory], notice: 'Directory was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @directory.errors, status: :unprocessable_entity }
        end
      end
    end

    # def destroy
    #   @user.destroy

    #   respond_to do |format|
    #     format.html { redirect_to categories_url }
    #     format.json { head :no_content }
    #   end
    # end

    private

    def set_directory
      @directory = target_company.content_directories.find(params[:id])
    end
  end
end
