#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module CellsHelperMethods
  extend ActiveSupport::Concern

  included do
    helper ApplicationHelper
    include Devise::Controllers::Helpers
    helper_method :current_user
  end
end
