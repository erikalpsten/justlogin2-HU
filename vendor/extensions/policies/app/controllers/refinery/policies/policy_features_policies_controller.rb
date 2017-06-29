module Refinery
  module Policies
    class PolicyFeaturesPoliciesController < ::ApplicationController

      before_action :find_all_policy_features_policies
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_features_policy in the line below:
        present(@page)
      end

      def show
        @policy_features_policy = PolicyFeaturesPolicy.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_features_policy in the line below:
        present(@page)
      end

    protected

      def find_all_policy_features_policies
        @policy_features_policies = PolicyFeaturesPolicy.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policy_features_policies").first
      end

    end
  end
end
