class AddModeratorToPermissionsToFamilies < ActiveRecord::Migration
  def change
    add_column :permissions_to_families, :moderator, :boolean
  end
end
