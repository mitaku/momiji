module ContentManagementFeature
  class Directory < ActiveRecord::Base
    has_ancestry

    belongs_to :company, :class_name => "::Company"
    has_many :contents, :dependent => :destroy

    attr_accessible :ancestry, :name
  end
end
