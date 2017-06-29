
FactoryGirl.define do
  factory :employee, :class => Refinery::Policies::Employee do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

