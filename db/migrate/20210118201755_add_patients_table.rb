class AddPatientsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :gender, null: false
      t.string :doctor_email

      t.timestamps
    end

    add_index :patients, [:first_name, :last_name]
  end
end
