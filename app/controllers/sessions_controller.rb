#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class SessionsController < Devise::SessionsController

  private
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || company_path(resource.company.becomes(Company))
  end
end
