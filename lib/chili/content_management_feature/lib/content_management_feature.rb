require "chili"
require "content_management_feature/engine"
require "carrierwave"

module ContentManagementFeature
  extend Chili::Base
  active_if { true } # edit this to activate/deactivate feature at runtime
end
