class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.boolean :accepted
      t.references :recipient
      t.references :sender
      t.references :family

      t.timestamps
    end
    add_index :invitations, :recipient_id
    add_index :invitations, :sender_id
    add_index :invitations, :family_id
  end
end
