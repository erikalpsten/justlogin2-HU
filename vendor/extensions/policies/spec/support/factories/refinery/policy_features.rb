
FactoryGirl.define do
  factory :policy_feature, :class => Refinery::Policies::PolicyFeature do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

