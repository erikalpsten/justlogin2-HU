
FactoryGirl.define do
  factory :policy, :class => Refinery::Policies::Policy do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

