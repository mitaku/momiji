module ContentManagementFeature
  class Directory < ActiveRecord::Base
    has_ancestry

    belongs_to :company, :class_name => "::Company"

    attr_accessible :ancestry, :name
  end
end
