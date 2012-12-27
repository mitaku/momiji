#!/usr/bin/env ruby
# -*- coding: utf-8 -*-


require_dependency "rset_mcm/application_controller"

module RsetMcm
  class DirectoriesController < ApplicationController
    respond_to :html
    before_filter :set_directory

    def create
      @new_directory = @directory.build_directory(params[:directory])

      if @new_directory.save
        options = {:notice => I18n.t("rset_mcm.directories.notice.create")}
      else
        options = {:alert => I18n.t("rset_mcm.errors.mkdir")}
      end

      redirect_to(content_path(@directory), options)
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:content_id])
    end
  end
end
