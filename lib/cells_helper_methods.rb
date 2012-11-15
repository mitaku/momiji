#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module CellsHelperMethods
  extend ActiveSupport::Concern

  included do
    helper ApplicationHelper
    include ApplicationMethods
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions
    helper_method :current_user
  end
end
