class AddPhoneCompanyToRefineryAuthenticationDeviseUsers < ActiveRecord::Migration
  def change
    add_column :refinery_authentication_devise_users, :comapany, :string
    add_column :refinery_authentication_devise_users, :phone, :string
  end
end
