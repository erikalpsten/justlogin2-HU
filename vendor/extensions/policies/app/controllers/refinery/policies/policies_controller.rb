module Refinery
  module Policies
    class PoliciesController < ::ApplicationController

      before_action :find_all_policies
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy in the line below:
        present(@page)
      end

      def show
        @policy = Policy.find(params[:id])

        # get feature group id each feature belongs to and remove duplicates with Set
        featureGroups = Set.new
        @policy.policy_features.each do |feature|
          featureGroups.add feature.policy_feature_group_id
        end

        # retrieve feature groups from PolicyFeatureGroup from id 
        @feature_groups = Array.new
        policy_feature_group = PolicyFeatureGroup.order('position ASC')
        featureGroups.each do |featureGroup|
          @feature_groups.push policy_feature_group.find_by id: featureGroup
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy in the line below:
        respond_to do |format|
          format.html # show.html.erb
          format.js # show.js.erb
          format.json { render json: @book}
        end
      end

    protected

      def find_all_policies
        @policies = Policy.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policies").first
      end

    end
  end
end
