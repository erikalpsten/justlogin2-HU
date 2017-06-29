class CreateJointableAttachmentsPolicies < ActiveRecord::Migration
  def change
    create_table :attachments_policies do |t|
      t.integer :refinery_policy_id
      t.integer :refinery_policy_attachment_id
    end
    add_index :attachments_policies, [:refinery_policy_id, :refinery_policy_attachment_id], name: 'attachments_policies_index'
  end
end
