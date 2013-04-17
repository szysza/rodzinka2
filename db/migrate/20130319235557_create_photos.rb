class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.references :album

      t.timestamps
    end
  end
end
