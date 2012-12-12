#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module CellsHelperMethods
  extend ActiveSupport::Concern

  included do
    helper ApplicationHelper
    include ApplicationMethods
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions
    include HasScope
    include Kaminari::ActionViewExtension
    helper_method :current_user

    def search_paginate_widget_url(page, options = {})
      url_parameter = {
        :company_id => target_company.code,
        :search => @search_params.merge(:page => (page <= 1 ? 1 : page))
      }.merge(options)

      url_for_event(:search, url_parameter)
    end
    helper_method :search_paginate_widget_url
  end
end
