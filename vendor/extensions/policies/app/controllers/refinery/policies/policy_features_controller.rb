module Refinery
  module Policies
    class PolicyFeaturesController < ::ApplicationController

      before_action :find_all_policy_features
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_feature in the line below:
        present(@page)
      end

      def show
        @policy_feature = PolicyFeature.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_feature in the line below:
        present(@page)
      end

    protected

      def find_all_policy_features
        @policy_features = PolicyFeature.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policy_features").first
      end

    end
  end
end
