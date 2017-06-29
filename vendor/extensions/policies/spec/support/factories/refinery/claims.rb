
FactoryGirl.define do
  factory :claim, :class => Refinery::Policies::Claim do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

