class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :name
      t.string :token
      t.text :description

      t.timestamps
    end
  end
end
