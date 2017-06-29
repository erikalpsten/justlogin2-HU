module Refinery
  module Policies
    class Policy < Refinery::Core::BaseModel
      self.table_name = 'refinery_policies'

      has_many :policy_feature_policies,  ->{ order('refinery_policies_policy_features_policies.position')},
                                          class_name: 'Refinery::Policies::PolicyFeaturesPolicy',
                                          foreign_key: 'policy_id',
                                          inverse_of: :policy,
                                          dependent: :destroy

      has_many :policy_summary_feature_policies, ->{ order('refinery_policies_policy_features_policies.position')
                                                      .where('refinery_policies_policy_features_policies.is_in_summary')
                                                     },
                                                  class_name: 'Refinery::Policies::PolicyFeaturesPolicy',
                                                  foreign_key: 'policy_id',
                                                  inverse_of: :policy


      belongs_to :employee, :foreign_key => 'employee_id'
      belongs_to :claim, :foreign_key => 'claim_id'

      has_and_belongs_to_many :attachments, class_name: 'Refinery::Policies::Attachment', join_table: 'attachments_policies',
                              association_foreign_key: 'refinery_policy_attachment_id', foreign_key: 'refinery_policy_id'

      belongs_to :refinery_user, class_name: 'Refinery::Authentication::Devise::User', :foreign_key => 'user_id'

      has_many :policy_features, through: :policy_feature_policies
      has_many :summary_features, through: :policy_summary_feature_policies

      accepts_nested_attributes_for :policy_feature_policies, :allow_destroy => true
      accepts_nested_attributes_for :attachments

      validates :name, :insurer, :presence => true

      belongs_to :logo, :class_name => '::Refinery::Image'
      belongs_to :file, :class_name => '::Refinery::Resource'
      belongs_to :benefit, class_name: 'Refinery::Products::Benefit', foreign_key: 'benefit_id', inverse_of: :policies

      acts_as_indexed :fields => [ :name ]

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
    end
  end
end
