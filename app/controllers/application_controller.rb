class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :create_hr_role
  protect_from_forgery with: :exception

  # Redirect HR User to hr user dashboard after signing in otherwise go to refinery dashboard
  def after_sign_in_path_for(resource)
    if resource.has_role?(:hruser)
      '/main'
    else
      '/admin/products/feature_groups'
    end
  end

  # Redirect to common login page after logout
  def after_sign_out_path_for(resource_or_scope)
    '/login'
  end

  private

  # Create hr role if it doesn't exist
  def create_hr_role
    Refinery::Authentication::Devise::Role.[]('Hruser')
  end
end
