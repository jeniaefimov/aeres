# frozen_string_literal: true

class LabResult < ApplicationRecord
  belongs_to :patient

  validates :test_type, :file, presence: true
end
