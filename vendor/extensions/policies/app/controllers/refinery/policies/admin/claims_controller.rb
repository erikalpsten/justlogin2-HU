module Refinery
  module Policies
    module Admin
      class ClaimsController < ::Refinery::AdminController

        crudify :'refinery/policies/claim',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def claim_params
          params.require(:claim).permit(:name, :description)
        end
      end
    end
  end
end
