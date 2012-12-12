module ContentManagementFeature
  class Content < ActiveRecord::Base
    belongs_to :company, :class_name => "::Company"
    attr_accessible :name, :data
    mount_uploader :data, ContentUploader
  end
end
