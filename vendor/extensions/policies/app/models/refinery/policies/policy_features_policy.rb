module Refinery
  module Policies
    class PolicyFeaturesPolicy < Refinery::Core::BaseModel

      belongs_to :policy, class_name: 'Refinery::Policies::Policy', foreign_key: 'policy_id'
      belongs_to :policy_feature, class_name: 'Refinery::Policies::PolicyFeature',
                                   foreign_key: 'policy_feature_id'

      validates :policy_feature_id, uniqueness: { scope: :policy_id }

      default_scope { includes(:policy_feature) }

      delegate :name, to: :policy_feature, prefix: :feature

      scope :in_summary, ->(){
        where('is_in_summary')
      }
    end
  end
end
