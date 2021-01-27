# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  has_many :lab_results, dependent: :destroy

  validates :first_name, :last_name, :gender, :date_of_birth, presence: true
  validates :gender, inclusion: Users::Constants::GENDER
end
