require_dependency "rset_mcm/application_controller"

module RsetMcm
  class ContentsController < ApplicationController
    respond_to :html

    before_filter :authenticate_user!
    before_filter :set_directory, :only => [:show, :edit, :destroy, :update]

    def show
    end

    def edit
    end

    def destroy
      raise if @directory.is_root?
      @directory.destroy

      redirect_to content_path(@directory.parent), notice: I18n.t("rset_mcm.contents.notice.destroy", :name => @directory.name)
    end

    def update
      if @directory.update_attributes(params[:content])
        redirect_to content_path(@directory), notice: I18n.t("rset_mcm.contents.notice.update", :name => @directory.name)
      else
        render action: "edit"
      end
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:id])
    end
  end
end
