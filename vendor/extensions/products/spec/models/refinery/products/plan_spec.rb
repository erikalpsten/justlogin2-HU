require 'spec_helper'

module Refinery
  module Products
    describe Plan do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:plan,
          :icon_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:icon_name) { should == "Refinery CMS" }
      end
    end
  end
end
