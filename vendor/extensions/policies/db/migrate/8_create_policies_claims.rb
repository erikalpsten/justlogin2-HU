class CreatePoliciesClaims < ActiveRecord::Migration

  def up
    create_table :refinery_policies_claims do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end
    
    add_column :refinery_policies, :claim_id, :integer, index: true
    add_column :refinery_policies, :advisor_name, :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policies/claims"})
    end

    drop_table :refinery_policies_claims

  end

end
