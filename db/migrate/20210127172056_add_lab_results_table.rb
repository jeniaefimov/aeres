class AddLabResultsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :lab_results do |t|
      t.references :patient, foreign_key: true, null: false, index: true
      t.string :test_type, null: false, index: true
      t.string :file, null: false
      t.jsonb :results
      t.datetime :next_at

      t.timestamps
    end
  end
end
