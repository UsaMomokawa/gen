require_relative '20190502132712_create_users'

class AddEmailAndPasswordColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    revert CreateUsers

    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
