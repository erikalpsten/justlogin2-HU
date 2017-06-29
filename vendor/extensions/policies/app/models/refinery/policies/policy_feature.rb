module Refinery
  module Policies
    class PolicyFeature < Refinery::Core::BaseModel

      belongs_to :policy_feature_group, :foreign_key => 'policy_feature_group_id'
      has_many :policy_feature_policies, class_name: 'Refinery::Policies::PolicyFeaturesPolicy',
                                           foreign_key: 'policy_feature_id',
                                           inverse_of: :policy_feature,
                                           dependent: :destroy

      validates :name, :presence => true, :uniqueness => true
      validates :policy_feature_group_id, :presence => true

      scope :order_by_name, ->() {
            unscoped.order(:name)
      }
      acts_as_indexed :fields => [:name]

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
