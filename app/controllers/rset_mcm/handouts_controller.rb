require_dependency "rset_mcm/application_controller"

module RsetMcm
  class HandoutsController < ApplicationController
    respond_to :html

    before_filter :set_directory
    before_filter :set_handout, :only => [:show, :edit, :update, :destroy]
    before_filter :contents_authorize!

    def download
      handout = @directory.handouts.find_by_name!(params[:name])

      response.header['X-Accel-Redirect'] = '/app/mcm/.reploxy'
      response.header["X-Reproxy-Url"] = handout.data.to_s

      render :nothing => true, :status => 200
    end

    def show
    end

    def edit
    end

    def update
      if @handout.update_attributes(params[:handout])
        redirect_to content_path(@directory), notice: I18n.t("rset_mcm.handouts.notice.update", name: @handout.name)
      else
        render action: "edit"
      end
    end

    def create
      @content = @directory.build_handout(params[:handout])

      if @content.save
        options = {:notice => I18n.t("rset_mcm.handouts.notice.create")}
      else
        options = {:alert => I18n.t("rset_mcm.errors.file_upload")}
      end
      redirect_to content_path(@directory), options
    end

    def destroy
      @handout.destroy

      redirect_to content_path(@directory), notice: I18n.t("rset_mcm.handouts.notice.destroy", name: @handout.name)
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:content_id])
      @current_authority = RsetMcm::ContentAuthority.new(@directory, current_user)
    end

    def set_handout
      @handout = @directory.handouts.find(params[:id])
    end
  end
end
