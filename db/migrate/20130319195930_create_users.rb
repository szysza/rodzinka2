class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.text :description

      t.timestamps
    end
  end
end
