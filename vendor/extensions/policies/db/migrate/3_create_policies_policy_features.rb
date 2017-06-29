class CreatePoliciesPolicyFeatures < ActiveRecord::Migration

  def up
    create_table :refinery_policies_policy_features do |t|
      t.string :name
      t.integer :policy_feature_group_id
      t.integer :position

      t.timestamps
    end
    add_index :refinery_policies_policy_features, :policy_feature_group_id, name: 'policy_feature_group_id_idx'
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/policy_features"})
    end

    drop_table :refinery_policies_policy_features

  end

end
