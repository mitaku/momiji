module Chocoholic
  class Engine < ::Rails::Engine
    isolate_namespace Chocoholic
    config.generators do |g|
      g.template_engine :haml
      g.javascript_engine :coffee
      g.test_framework :rspec #, view_specs: false, routing_specs: false, controller_specs: false
      g.integration_tool :rspec
    end
  end
end
