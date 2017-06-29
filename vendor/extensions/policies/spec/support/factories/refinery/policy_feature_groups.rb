
FactoryGirl.define do
  factory :policy_feature_group, :class => Refinery::Policies::PolicyFeatureGroup do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

