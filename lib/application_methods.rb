#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module ApplicationMethods
  def current_company
    @current_company ||= current_user.company
  end

  def target_company(code = nil)
    return @target_company unless @target_company.nil?
    code ||= params[:company_id]
    return nil unless code
    return nil unless current_company
    return @target_company = current_company if code == current_company.code

    @target_company ||= accessible_company(code)

    raise ActiveRecord::RecordNotFound if @target_company.nil?

    @target_company
  end

  private

  def accessible_company(code)
    case current_company
    when Administration
      Company.accessible_by(current_ability).where_code_is(code).first
    when Provider
      current_company.customers.accessible_by(current_ability).where_code_is(code).first ||
      Provider.accessible_by(current_ability).where_code_is(code).first
    when Customer
      Customer.where_code_is(code).first
    else
      raise
    end
  end
end
