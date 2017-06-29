# This migration comes from refinery_policies (originally 5)
class CreatePoliciesEmployees < ActiveRecord::Migration

  def up
    create_table :refinery_policies_employees do |t|
      t.string :name
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/employees"})
    end

    drop_table :refinery_policies_employees

  end

end
