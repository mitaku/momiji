module RsetMcm
  class Permission < ActiveRecord::Base
    extend Enumerize

    attr_accessor :resource_type_name, :resource_object_id

    belongs_to :content
    attr_accessible :mode, :resource_type_name, :resource_object_id

    belongs_to :resource, :polymorphic => true
    belongs_to :content

    validates :mode, :presence => true
    validates :resource_id, :uniqueness => {:scope => [:content_id, :resource_type]}, :presence => true

    enumerize :mode, in: [:readonly, :writable]

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
      case self.resource_type_name.try(:downcase)
      when "user"
        self.resource_type = "User"
        self.resource_id = self.resource_object_id
      else
      end
    end
  end
end
