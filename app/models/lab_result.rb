# frozen_string_literal: true

class LabResult < ApplicationRecord
  belongs_to :patient

  has_one_attached :file

  validates :test_type, presence: true
end
