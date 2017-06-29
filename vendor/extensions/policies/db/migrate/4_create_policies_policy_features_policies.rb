class CreatePoliciesPolicyFeaturesPolicies < ActiveRecord::Migration

  def up
    create_table :refinery_policies_policy_features_policies do |t|
      t.integer :policy_feature_id
      t.integer :policy_id
      t.string :value
      t.boolean :is_in_summary
      t.integer :position

      t.timestamps
    end
    add_index(:refinery_policies_policy_features_policies, [:policy_feature_id, :policy_id], name: 'policy_feature_policy_idx')
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/policy_features_policies"})
    end

    drop_table :refinery_policies_policy_features_policies

  end

end
