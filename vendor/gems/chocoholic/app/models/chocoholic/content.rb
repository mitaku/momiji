module Chocoholic
  class Content < ActiveRecord::Base
    attr_accessible :name, :ancestry
    belongs_to :company, :class_name => "::Company"
    has_ancestry

    validates :name, :uniqueness => {:scope => :ancestry}, :presence => true

    def icon_path
      "chocoholic/filetype/#{file_type}.png"
    end

    def becomes_content
      becomes(Content)
    end

    def directory?
      false
    end

    def file_type
      raise NotImprementError
    end
  end
end
