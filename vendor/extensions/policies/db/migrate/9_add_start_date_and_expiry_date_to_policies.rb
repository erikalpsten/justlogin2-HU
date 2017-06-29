class AddStartDateAndExpiryDateToPolicies < ActiveRecord::Migration
  def change
    add_column :refinery_policies, :start_date, :date
    add_column :refinery_policies, :expiry_date, :date
  end
end
