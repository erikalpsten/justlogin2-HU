require 'spec_helper'

module Refinery
  module Policies
    describe PolicyFeaturesPolicy do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:policy_features_policy,
          :value => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:value) { should == "Refinery CMS" }
      end
    end
  end
end
