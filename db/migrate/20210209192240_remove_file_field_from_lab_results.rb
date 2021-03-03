# frozen_string_literal: true

class RemoveFileFieldFromLabResults < ActiveRecord::Migration[6.1]
  def up
    safety_assured { remove_column :lab_results, :file }
  end

  def down
    add_column :lab_results, :file, :string, null: false
  end
end
