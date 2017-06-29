module Refinery
  module Policies
    module Admin
      class PolicyFeaturesPoliciesController < ::Refinery::AdminController

        crudify :'refinery/policies/policy_features_policy',
                :title_attribute => 'value'

        private

        # Only allow a trusted parameter "white list" through.
        def policy_features_policy_params
          params.require(:policy_features_policy).permit(:policy_feature_id, :policy_id, :value, :is_in_summary)
        end
      end
    end
  end
end
