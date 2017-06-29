class CreatePoliciesPolicies < ActiveRecord::Migration

  def up
    create_table :refinery_policies do |t|
      t.string :name
      t.integer :logo_id
      t.string :insurer
      t.decimal :premium
      t.integer :benefit_id
      t.integer :position

      t.timestamps
    end
    add_index :refinery_policies, :benefit_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/policies"})
    end

    drop_table :refinery_policies

  end

end
