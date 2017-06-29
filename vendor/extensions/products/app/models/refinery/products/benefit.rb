module Refinery
  module Products
    class Benefit < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name, use: :slugged

      has_many :products, class_name: 'Refinery::Products::Product',
                          foreign_key: 'benefit_id',
                          inverse_of: :benefit

      has_many :policies, class_name: 'Refinery::Policies::Policy',
                          foreign_key: 'benefit_id',
                          inverse_of: :benefit

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:name]

    end
  end
end
