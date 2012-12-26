require_dependency "rset_mcm/application_controller"

module RsetMcm
  class HomeController < ApplicationController

    def index
      content = target_company.directories.roots.first
      redirect_to content_path(content.id)
    end
  end
end
