module Refinery
  module Policies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Policies

      engine_name :refinery_policies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "policies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policies_admin_policies_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Policies)
      end
    end
  end
end
