module ContentManagementFeature
  class Content < ActiveRecord::Base
    belongs_to :company
    attr_accessible :md5, :name
  end
end
