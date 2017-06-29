# This migration comes from refinery_policies (originally 7)
class CreatePoliciesAttachments < ActiveRecord::Migration

  def up
    create_table :refinery_policies_attachments do |t|
      t.integer :file_id
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
      ::Refinery::Page.delete_all({:link_url => "/policies/attachments"})
    end

    drop_table :refinery_policies_attachments

  end

end
