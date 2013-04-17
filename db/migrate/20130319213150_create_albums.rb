class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.string :visibility
      t.references :owner, polymorphic: true

      t.timestamps
    end
    add_index :albums, :owner_id
  end
end
