module RsetMcm
  class Permission < ActiveRecord::Base
    belongs_to :content
    attr_accessible :mode, :resource_id, :resource_type
  end
end
