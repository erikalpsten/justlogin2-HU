module Refinery
  module Policies
    class Employee < Refinery::Core::BaseModel

      belongs_to :refinery_user, class_name: 'Refinery::Authentication::Devise::User', :foreign_key => 'user_id'
      has_many :policies

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
