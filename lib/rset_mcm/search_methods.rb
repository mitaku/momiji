#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module RsetMcm
  module SearchMethods
    extend ActiveSupport::Concern

    def search_filename(scope, query)
      (query || "").split(space_regex).inject(scope) do |relation, word|
        word = escape_wildcard(word)
        relation.where("name like ?", "%#{word}%")
      end
    end

    def space_regex
      Regexp.new("[\s\u3000]+")
    end

    def escape_wildcard(word)
      word.to_s.gsub(/[_%\\]/){"\\#{$&}"}
    end
  end
end
