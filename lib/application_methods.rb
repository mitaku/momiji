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

    @target_company ||= Company.where_code_is(code).first

    raise ActiveRecord::RecordNotFound if @target_company.nil?

    @target_company
  end
end
