module Refinery
  module Policies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Policies

      engine_name :refinery_policies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "attachments"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policies_admin_attachments_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/policies/attachments(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Attachments)
      end
    end
  end
end
