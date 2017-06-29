module Refinery
  module Policies
    class PolicyFeatureGroupsController < ::ApplicationController

      before_action :find_all_policy_feature_groups
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_feature_group in the line below:
        present(@page)
      end

      def show
        @policy_feature_group = PolicyFeatureGroup.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_feature_group in the line below:
        present(@page)
      end

    protected

      def find_all_policy_feature_groups
        @policy_feature_groups = PolicyFeatureGroup.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policy_feature_groups").first
      end

    end
  end
end
