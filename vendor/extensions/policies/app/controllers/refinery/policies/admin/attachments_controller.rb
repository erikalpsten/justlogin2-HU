module Refinery
  module Policies
    module Admin
      class AttachmentsController < ::Refinery::AdminController

        crudify :'refinery/policies/attachment',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def attachment_params
          params.require(:attachment).permit(:file_id, :name)
        end
      end
    end
  end
end
