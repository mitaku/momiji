class ApplicationController < ActionController::Base
  protect_from_forgery

  def target_company
    @target_company ||= Company.where_code_is(params[:company_id]).first
  end
  helper_method :target_company

  def current_company
    @current_company ||= current_user.company
  end
end
