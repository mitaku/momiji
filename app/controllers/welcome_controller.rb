class WelcomeController < ApplicationController
  before_filter :signed_in_check
  def index
  end

  private

    def signed_in_check
      if signed_in?
        redirect_to company_path(current_user.company.code)
        return false
      end
      true
    end

end
