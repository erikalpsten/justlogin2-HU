module Refinery
  module Policies
    module Admin
      class PolicyFeaturesController < ::Refinery::AdminController

        crudify :'refinery/policies/policy_feature',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def policy_feature_params
          params.require(:policy_feature).permit(:name, :value, :policy_feature_group_id)
        end
      end
    end
  end
end
