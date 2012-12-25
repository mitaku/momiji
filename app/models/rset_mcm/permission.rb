module RsetMcm
  class Permission < ActiveRecord::Base
    belongs_to :content
    attr_accessible :mode

    belongs_to :resource, :polymorphic => true
    belongs_to :content

    validates :mode, :presence => true
    validates :resource_id, :uniqueness => {:scope => [:content_id, :resource_type]}, :presence => true
  end
end
