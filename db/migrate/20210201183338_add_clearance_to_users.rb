class AddClearanceToUsers < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def self.up
    change_table :users do |t|
      t.string :encrypted_password, limit: 128
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
    end

    add_index :users, :remember_token, algorithm: :concurrently
  end

  def self.down
    change_table :users do |t|
      t.remove :encrypted_password, :confirmation_token, :remember_token
    end
  end
end
