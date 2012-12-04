# -*- coding: utf-8 -*-

class SidebarWidget < Apotomo::Widget
  DEFAULT_PER = 10

  include CellsHelperMethods

  responds_to_event :search

  def show(_params = {})
    _params ||= {}
    @search_params ||= {}

    @objects = apply_scopes(get_objects, @search_params.merge!(_params.symbolize_keys))
    @search = OpenStruct.new(@search_params)

    render
  end

  def search(event)
    @search_params = event.data.to_hash.symbolize_keys[:search] || {}
    update :state => :show
  end

  private
    def get_objects
      raise NotImplementedError
    end

  class << self
    def set_pagination
      has_scope :page, :default => 1
      has_scope :per, :default => DEFAULT_PER
    end

    def space_regex
      Regexp.new("[\s\u3000]+")
    end

    def escape_wildcard(word)
      word.to_s.gsub(/[_%\\]/){"\\#{$&}"}
    end
  end

end
