# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  has_many :lab_results, dependent: :destroy

  validates :first_name, :last_name, :gender, :date_of_birth, presence: true
  validates :gender, inclusion: Users::Constants::GENDER

  validates :doctor_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email has invalid format" },
            length: { minimum: 4, maximum: 254 }
end
