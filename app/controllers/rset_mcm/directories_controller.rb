#!/usr/bin/env ruby
# -*- coding: utf-8 -*-


require_dependency "rset_mcm/application_controller"

module RsetMcm
  class DirectoriesController < ApplicationController
    before_filter :set_directory

    def create
      @new_directory = @directory.build_directory(params[:directory])

      respond_to do |format|
        if @new_directory.save
          format.html { redirect_to(content_path(@directory), notice: 'Directory was successfully created.' ) }
        else
          raise
        end
      end
    end

    private
    def set_directory
      @directory = target_company.directories.find(params[:content_id])
    end
  end
end
