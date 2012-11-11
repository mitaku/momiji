class ApplicationController < ActionController::Base
  protect_from_forgery

  def target_company
    @target_company ||= Company.where_code_is(params[:company_id])
  end

  def current_company
    @current_company ||= current_user.company
  end
end
