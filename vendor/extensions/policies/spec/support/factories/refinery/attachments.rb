
FactoryGirl.define do
  factory :attachment, :class => Refinery::Policies::Attachment do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

