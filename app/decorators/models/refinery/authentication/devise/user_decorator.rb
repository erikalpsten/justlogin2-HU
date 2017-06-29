Refinery::Authentication::Devise::User.class_eval do
  has_many :policies, class_name: 'Refinery::Policies::Policy'
  has_many :employees, class_name: 'Refinery::Policies::Employee'
end
