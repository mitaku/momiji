module Chocoholic
  class Permission < ActiveRecord::Base
    attr_accessor :resource_type_name, :resource_object_id
    attr_accessible :mode, :resource_type_name, :resource_object_id, :id

    belongs_to :resource, :polymorphic => true
    belongs_to :content

    validates :resource_id, :uniqueness => {:scope => [:content_id, :resource_type]}, :presence => true
    validates :resource_object_id, :presence => true


    before_validation :set_resource_type

    def resource_object_id=(val)
      @resource_object_id = val.presence
    end

    def resource_object_id
      @resource_object_id || id
    end

    def resource_type_name
      @resource_type_name || resource_type
    end

    private

    def set_resource_type
      case self.resource_type_name.downcase
      when "user"
        self.resource_type = "User"
        self.resource_id = self.resource_object_id
      when "category_item"
        self.resource_type = "CategoryItem"
        self.resource_id = self.resource_object_id
      else
        raise #TODO
      end
    end
  end
end
