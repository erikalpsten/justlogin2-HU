module Refinery
  module Policies
    class ClaimsController < ::ApplicationController

      before_action :find_all_claims
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @claim in the line below:
        present(@page)
      end

      def show
        @claim = Claim.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @claim in the line below:
        present(@page)
      end

    protected

      def find_all_claims
        @claims = Claim.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/claims").first
      end

    end
  end
end
