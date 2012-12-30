module RsetMcm
  class ApplicationController < ::ApplicationController
    before_filter :authenticate_user!

    private
    def contents_authorize!
      @current_authority ||= Set.new([])

      raise ActiveRecord::RecordNotFound if @current_authority.include?(:prohibit)
    end
  end
end
