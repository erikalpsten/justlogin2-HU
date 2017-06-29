
FactoryGirl.define do
  factory :policy_features_policy, :class => Refinery::Policies::PolicyFeaturesPolicy do
    sequence(:value) { |n| "refinery#{n}" }
  end
end

