module Refinery
  module Policies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Policies

      engine_name :refinery_policies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "employees"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policies_admin_employees_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/policies/employees(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Employees)
      end
    end
  end
end
