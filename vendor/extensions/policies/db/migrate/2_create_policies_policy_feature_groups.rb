class CreatePoliciesPolicyFeatureGroups < ActiveRecord::Migration

  def up
    create_table :refinery_policies_policy_feature_groups do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/policy_feature_groups"})
    end

    drop_table :refinery_policies_policy_feature_groups

  end

end
