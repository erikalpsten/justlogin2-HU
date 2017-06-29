Refinery::Authentication::Devise::SessionsController.class_eval do
  layout 'dashboard'
  def new_hr_user
    new
  end
end
