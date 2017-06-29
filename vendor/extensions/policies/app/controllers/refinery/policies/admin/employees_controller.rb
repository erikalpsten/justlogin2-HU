module Refinery
  module Policies
    module Admin
      class EmployeesController < ::Refinery::AdminController

        crudify :'refinery/policies/employee',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def employee_params
          params.require(:employee).permit(:name, :user_id, :position)
        end
      end
    end
  end
end
