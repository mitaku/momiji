#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'set'

module RsetMcm
  class ContentAuthority
    attr_reader :set, :content

    delegate :empty?, :to => :set

    def initialize(_content, _obj)
      @content = _content
      @set = @content.authority_of(_obj)
    end

    def prohibit?
      set.include?(:prohibit)
    end

    def accessible?
      !prohibit? && (empty? || !(set & accessible_sets).empty?)
    end

    def writable?
      (set.empty? || set.include?(:writable)) && !prohibit?
    end

    def readonly?
      (set.empty? || set.include?(:writable)) && !prohibit?
    end

    private
    def accessible_sets
      Set.new([:readonly, :writable])
    end
  end
end
