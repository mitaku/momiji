require_dependency "rset_mcm/application_controller"

module RsetMcm
  class ContentsController < ApplicationController
    include SearchMethods

    respond_to :html

    before_filter :set_directory, :only => [:show, :edit, :destroy, :update]
    before_filter :contents_authorize!, :only => [:show, :edit, :destroy, :update]

    def index
      if params[:q].is_a?(String)
        contents = search_filename(target_company.contents, params[:q])
        @groups = contents.group_by { |c| c.parent }
        @groups.delete(nil)
        @groups = @groups.sort_by { |parent, contents| parent.try(:name) }
      else
        @groups = {}
      end
    end

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
      @current_authority = RsetMcm::ContentAuthority.new(@directory, current_user)
    end
  end
end
