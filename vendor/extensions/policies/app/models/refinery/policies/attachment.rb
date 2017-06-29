module Refinery
  module Policies
    class Attachment < Refinery::Core::BaseModel


      validates :name, :presence => true, :uniqueness => true

      has_and_belongs_to_many :policies, class_name: 'Refinery::Policies::Policy', join_table: 'attachments_policies',
                              foreign_key: 'refinery_policy_attachment_id', association_foreign_key: 'refinery_policy_id'

      belongs_to :file, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
