module Refinery
  module Policies
    module Admin
      class PolicyFeatureGroupsController < ::Refinery::AdminController

        crudify :'refinery/policies/policy_feature_group',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def policy_feature_group_params
          params.require(:policy_feature_group).permit(:name)
        end
      end
    end
  end
end
