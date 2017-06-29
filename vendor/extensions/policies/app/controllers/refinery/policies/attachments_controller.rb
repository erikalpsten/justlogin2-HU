module Refinery
  module Policies
    class AttachmentsController < ::ApplicationController

      before_action :find_all_attachments
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @attachment in the line below:
        present(@page)
      end

      def show
        @attachment = Attachment.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @attachment in the line below:
        present(@page)
      end

    protected

      def find_all_attachments
        @attachments = Attachment.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/attachments").first
      end

    end
  end
end
