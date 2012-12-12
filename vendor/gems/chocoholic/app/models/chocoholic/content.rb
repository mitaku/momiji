module Chocoholic
  class Content < ActiveRecord::Base
    attr_accessible :name, :ancestry
    belongs_to :company, :class_name => "::Company"
    has_ancestry
  end
end
