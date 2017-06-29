module Refinery
  module Policies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Policies

      engine_name :refinery_policies

      # before_inclusion do
      #   Refinery::Plugin.register do |plugin|
      #     plugin.name = "policy_features_policies"
      #     plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policies_admin_policy_features_policies_path }
      #     plugin.pathname = root
      #     plugin.menu_match = %r{refinery/policies/policy_features_policies(/.*)?$}
      #   end
      # end

      config.after_initialize do
        Refinery.register_extension(Refinery::PolicyFeaturesPolicies)
      end
    end
  end
end
