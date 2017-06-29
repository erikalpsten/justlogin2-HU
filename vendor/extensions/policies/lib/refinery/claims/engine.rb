module Refinery
  module Policies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Policies

      engine_name :refinery_policies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "claims"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policies_admin_claims_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/policies/claims(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Claims)
      end
    end
  end
end
