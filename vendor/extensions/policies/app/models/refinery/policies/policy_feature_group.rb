module Refinery
  module Policies
    class PolicyFeatureGroup < Refinery::Core::BaseModel

      has_many :policy_features, :foreign_key => 'policy_feature_group_id'

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:name]

    end
  end
end
