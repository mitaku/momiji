#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module RsetMcm
  module CompanyMethods
    extend ActiveSupport::Concern

    included do
      has_many :contents, :class_name => "::RsetMcm::Content", :dependent => :destroy
      has_many :directories, :class_name => "::RsetMcm::Directory"

      acts_as_tagger
      after_create :create_root_directory
    end

    def create_root_directory
      directories.create!(:name => 'HOME')
    end
  end
end
