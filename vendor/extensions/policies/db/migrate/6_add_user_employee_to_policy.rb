class AddUserEmployeeToPolicy < ActiveRecord::Migration
  def change
    add_column :refinery_policies, :user_id, :integer, index: true
    add_column :refinery_policies, :employee_id, :integer,  index: true
  end
end
