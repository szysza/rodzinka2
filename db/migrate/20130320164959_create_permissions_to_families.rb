class CreatePermissionsToFamilies < ActiveRecord::Migration
  def change
    create_table :permissions_to_families do |t|
      t.references :user
      t.references :family

      t.timestamps
    end
    add_index :permissions_to_families, :user_id
    add_index :permissions_to_families, :family_id
  end
end
